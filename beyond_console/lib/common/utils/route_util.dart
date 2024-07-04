import 'package:beyond_console/presentation/pages/components/button_page.dart';
import 'package:beyond_console/presentation/pages/components/card_page.dart';
import 'package:beyond_console/presentation/pages/connect_page.dart';
import 'package:beyond_console/presentation/pages/dashboard_page.dart';
import 'package:beyond_console/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteUtil {
  /// This global key is used for retrieve current context
  static var navigatorKey = GlobalKey<NavigatorState>();

  /// This is a constant for initial route, it can be main page / splash or even
  /// authentication pages depend on the authentication proccess
  String get initialRoute => ConnectPage.routeName;

  /// This is map of all routes, every single page that will be used in the
  /// future must be added to this map routes.
  GoRouter get goRouterConfig => GoRouter(
        initialLocation: initialRoute,
        routes: [
          GoRoute(
            path: ConnectPage.routeName,
            builder: (context, state) => const ConnectPage(),
          ),
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
                path: ButtonPage.routeName,
                builder: (context, state) => const ButtonPage(),
              ),
              GoRoute(
                path: CardPage.routeName,
                builder: (context, state) => const CardPage(),
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
