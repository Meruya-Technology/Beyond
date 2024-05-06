import 'package:beyond_console/presentation/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'common/const/strings.dart';

void main() {
  setPathUrlStrategy();
  WebViewPlatform.instance = WebWebViewPlatform();
  runApp(
    const ProviderScope(
      child: BeyondConsoleApp(),
    ),
  );
}

class BeyondConsoleApp extends ConsumerWidget {
  const BeyondConsoleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(globalProvider);
    return MaterialApp.router(
      title: Strings.digitalProductBusiness,
      routerConfig: provider.routeUtil.goRouterConfig,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: provider.brightness,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(
            brightness: provider.brightness,
          ).textTheme,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
