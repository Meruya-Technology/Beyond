import 'package:beyond_console/presentation/pages/home_page.dart';
import 'package:beyond_console/presentation/pages/network_page.dart';
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
          label: 'Network Inspector',
          icon: FeatherIcons.wifi,
          onTap: () {
            context.go(
              NetworkPage.routeName,
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
