import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class WebViewProvider extends ChangeNotifier {
  PlatformWebViewController getController(String webUrl) {
    return PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
        LoadRequestParams(
          uri: Uri.parse(webUrl),
        ),
      );
  }
}

final webViewProvider = ChangeNotifierProvider(
  (ref) => WebViewProvider(),
);
