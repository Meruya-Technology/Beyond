import 'package:beyond_console/presentation/params/navigation_menu.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  final navigationMenus = [
    NavigationMenu(
      label: 'Dashboard',
      icon: FeatherIcons.home,
      onTap: () {},
    ),
    NavigationMenu(
      label: 'Pesanan',
      icon: FeatherIcons.fileText,
      onTap: () {},
    ),
    NavigationMenu(
      label: 'Statistik',
      icon: FeatherIcons.barChart2,
      onTap: () {},
    ),
    NavigationMenu(
      label: 'Pelanggan',
      icon: FeatherIcons.users,
      onTap: () {},
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
