import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MicrosoftLoginScreen extends StatefulWidget {
  final String authUrl;
  final String redirectUri;

  const MicrosoftLoginScreen({
    super.key,
    required this.authUrl,
    required this.redirectUri,
  });

  @override
  State<MicrosoftLoginScreen> createState() => _MicrosoftLoginScreenState();
}

class _MicrosoftLoginScreenState extends State<MicrosoftLoginScreen> {
  final _windowsController = WebviewController();
  WebViewCookieManager? _macCookieManager;
  WebViewController? _macController;
  bool _isWebviewInitialized = false;
  bool _isCompleting = false;

  @override
  void initState() {
    super.initState();
    initWebview();
  }

  Future<void> initWebview() async {
    try {
      if (Platform.isWindows) {
        await _initWindowsWebview();
      } else if (Platform.isMacOS) {
        await _initMacWebview();
      } else {
        throw UnsupportedError(
            'Embedded Microsoft login is not supported on ${Platform.operatingSystem}.');
      }
      if (!mounted) return;
      setState(() {
        _isWebviewInitialized = true;
      });
    } catch (e) {
      if (mounted) {
        Navigator.of(context)
            .pop(Exception('WebView failed to initialize: $e'));
      }
    }
  }

  Future<void> _initWindowsWebview() async {
    await _windowsController.initialize();
    _windowsController.url.listen(_handleAuthUrl);
    await _clearWindowsState();
    await _windowsController.loadUrl(widget.authUrl);
  }

  Future<void> _initMacWebview() async {
    _macCookieManager = WebViewCookieManager();
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (_handleAuthUrl(request.url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (change) {
            final url = change.url;
            if (url != null) _handleAuthUrl(url);
          },
        ),
      );

    _macController = controller;
    await _clearMacState();
    await controller.loadRequest(Uri.parse(widget.authUrl));
  }

  bool _handleAuthUrl(String url) {
    if (!url.startsWith(widget.redirectUri) || _isCompleting) {
      return false;
    }

    final uri = Uri.parse(url);
    final code = uri.queryParameters['code'];
    final error = uri.queryParameters['error'];

    if (code != null) {
      unawaited(_finish(code));
    } else if (error != null) {
      final description = uri.queryParameters['error_description'];
      unawaited(_finish(Exception(description ?? error)));
    }

    return true;
  }

  Future<void> _finish(Object result) async {
    if (_isCompleting) return;
    _isCompleting = true;

    await _clearWebviewState();
    if (!mounted) return;
    Navigator.of(context).pop(result);
  }

  Future<void> _clearWebviewState() async {
    if (Platform.isWindows) {
      await _clearWindowsState();
    } else if (Platform.isMacOS) {
      await _clearMacState();
    }
  }

  Future<void> _clearWindowsState() async {
    try {
      await _windowsController.clearCache();
      await _windowsController.clearCookies();
    } catch (e) {
      debugPrint('Failed to clear Windows auth WebView state: $e');
    }
  }

  Future<void> _clearMacState() async {
    try {
      await _macCookieManager?.clearCookies();
      await _macController?.clearCache();
      await _macController?.clearLocalStorage();
    } catch (e) {
      debugPrint('Failed to clear macOS auth WebView state: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Microsoft Sign In'),
        backgroundColor: const Color(0xFF1A1D24),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF0C0E13),
      body: _isWebviewInitialized
          ? _buildWebview()
          : const Center(
              child: CircularProgressIndicator(color: Color(0xFF4CAF50))),
    );
  }

  Widget _buildWebview() {
    if (Platform.isWindows) {
      return Webview(_windowsController);
    }

    final macController = _macController;
    if (Platform.isMacOS && macController != null) {
      return WebViewWidget(controller: macController);
    }

    return const Center(
      child: Text(
        'Embedded login is not available on this platform.',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    if (!_isCompleting) {
      unawaited(_clearWebviewState());
    }
    _windowsController.dispose();
    super.dispose();
  }
}
