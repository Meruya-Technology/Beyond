import 'package:beyond_console/presentation/providers/web_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

import '../../common/const/dimensions.dart';

class WebView extends ConsumerWidget {
  final String webUrl;

  const WebView({
    super.key,
    required this.webUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(webViewProvider);
    return buildBody(context, provider);
  }

  Widget buildBody(BuildContext context, WebViewProvider provider) {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.l,
      ),
      child: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(
          controller: provider.getController(webUrl),
        ),
      ).build(context),
    );
  }
}
