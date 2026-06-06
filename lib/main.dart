import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import 'core/theme/app_theme.dart';
import 'shell/app_router.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'src/rust/frb_generated.dart';

Future<void> main(List<String> args) async {
  if (runWebViewTitleBarWidget(args)) {
    return;
  }
  WidgetsFlutterBinding.ensureInitialized();
  
  await RustLib.init();

  // ── Window setup ────────────────────────────────────────────────────────
  await Window.initialize();
  await windowManager.ensureInitialized();

  final options = WindowOptions(
    size: const Size(1280, 800),
    minimumSize: const Size(960, 640),
    center: true,
    backgroundColor: const Color(0xFF0C0E13),
    skipTaskbar: false,
    // macOS: hidden lets traffic lights float over app content so the
    // background colour is seamless. Windows/Linux: keep native chrome.
    titleBarStyle: Platform.isMacOS ? TitleBarStyle.hidden : TitleBarStyle.normal,
    title: 'Meridix Launcher',
  );

  // Apply platform-appropriate background effect
  if (Platform.isWindows) {
    await Window.setEffect(
      effect: WindowEffect.acrylic,
      color: const Color(0xCC0C0E13),
    );
  } else if (Platform.isMacOS) {
    await Window.setEffect(
      effect: WindowEffect.hudWindow,
      color: const Color(0xFF0C0E13),
    );
  } else {
    await Window.setEffect(
      effect: WindowEffect.transparent,
      color: const Color(0xFF0C0E13),
    );
  }

  await windowManager.waitUntilReadyToShow(options, () async {
    await windowManager.setBackgroundColor(const Color(0xFF0C0E13));
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const ProviderScope(child: MeridixLauncherApp()));
}

class MeridixLauncherApp extends StatelessWidget {
  const MeridixLauncherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Meridix Launcher',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(),
      routerConfig: appRouter,
    );
  }
}
