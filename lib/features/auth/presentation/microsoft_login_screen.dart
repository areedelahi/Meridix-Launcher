import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

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
  final _controller = WebviewController();
  bool _isWebviewInitialized = false;

  @override
  void initState() {
    super.initState();
    initWebview();
  }

  Future<void> initWebview() async {
    try {
      await _controller.initialize();
      _controller.url.listen((url) {
        if (url.startsWith(widget.redirectUri)) {
          final uri = Uri.parse(url);
          final code = uri.queryParameters['code'];
          final error = uri.queryParameters['error'];

          if (code != null) {
            Navigator.of(context).pop(code);
          } else if (error != null) {
            Navigator.of(context).pop(Exception(error));
          }
        }
      });

      await _controller.clearCache();
      await _controller.clearCookies();
      await _controller.loadUrl(widget.authUrl);

      if (!mounted) return;
      setState(() {
        _isWebviewInitialized = true;
      });
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop(Exception('WebView failed to initialize: $e'));
      }
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
          ? Webview(_controller)
          : const Center(child: CircularProgressIndicator(color: Color(0xFF4CAF50))),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
