import 'package:beyond_console/presentation/pages/custom_dashboard_page.dart';
import 'package:beyond_console/presentation/pages/home_page.dart';
import 'package:beyond_console/presentation/pages/json_generator_page.dart';
import 'package:beyond_console/presentation/pages/json_to_dart_page.dart';
import 'package:beyond_console/presentation/params/navigation_menu.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardProvider extends ChangeNotifier {
  final dashboardKey = GlobalKey<ScaffoldState>();
  String? currentPath;
  final pages = [
    {
      'route': '/transaction',
      'title': 'Transaction List',
    },
    {
      'route': '/payment',
      'title': 'Payment',
    }
  ];

  List<NavigationMenu> navigationMenus(BuildContext context) => [
        NavigationMenu(
          label: 'Dashboard',
          icon: FeatherIcons.home,
          onTap: () {
            context.go(
              HomePage.routeName,
            );
          },
        ),
        NavigationMenu(
          label: 'Json to dart',
          icon: FeatherIcons.code,
          onTap: () {
            context.go(
              JsonToDartPage.routeName,
            );
          },
        ),
        NavigationMenu(
          label: 'Json generator',
          icon: FeatherIcons.fileText,
          onTap: () {
            context.go(
              JsonGeneratorPage.routeName,
            );
          },
        ),
        NavigationMenu(
          label: 'Custom Dashboard',
          icon: FeatherIcons.monitor,
          onTap: () {
            context.go(
              CustomDashboardPage.routeName,
            );
          },
        ),
      ];

  int get currentIndex => pages.indexWhere(
        (page) => (currentPath == page['route']),
      );

  void changeSelectedPage(int index) {
    currentPath = pages[index]['route'];
    notifyListeners();
  }
}

final dashboardProvider = ChangeNotifierProvider(
  (ref) => DashboardProvider(),
);
