import 'package:beyond_console/presentation/pages/dashboard_page.dart';
import 'package:beyond_console/presentation/pages/home_page.dart';
import 'package:beyond_console/presentation/pages/json_generator_page.dart';
import 'package:beyond_console/presentation/pages/json_to_dart_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteUtil {
  /// This global key is used for retrieve current context
  static var navigatorKey = GlobalKey<NavigatorState>();

  /// This is a constant for initial route, it can be main page / splash or even
  /// authentication pages depend on the authentication proccess
  String get initialRoute => DashboardPage.routeName;

  /// This is map of all routes, every single page that will be used in the
  /// future must be added to this map routes.
  GoRouter get goRouterConfig => GoRouter(
        initialLocation: initialRoute,
        routes: [
          ShellRoute(
            builder: (context, state, child) => DashboardPage(
              child: child,
            ),
            routes: [
              GoRoute(
                path: HomePage.routeName,
                builder: (context, state) => const HomePage(),
              ),
              GoRoute(
                path: JsonGeneratorPage.routeName,
                builder: (context, state) => const JsonGeneratorPage(),
              ),
              GoRoute(
                path: JsonToDartPage.routeName,
                builder: (context, state) => const JsonToDartPage(),
              ),
            ],
          ),
        ],
      );

  /// onGenerateRoute is used to register fullscreen dialog, or anything that
  /// needed to be put on the middle of navigation proccess
  MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case CategorySelectorPage.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => const CategorySelectorPage(),
      //     fullscreenDialog: true,
      //     settings: RouteSettings(
      //       arguments: settings.arguments,
      //     ),
      //   );
      default:
        return null;
    }
  }
}
