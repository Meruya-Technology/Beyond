import 'package:beyond_console/presentation/pages/components/button_page.dart';
import 'package:beyond_console/presentation/pages/components/card_page.dart';
import 'package:beyond_console/presentation/pages/home_page.dart';
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
          label: 'Pages',
          icon: FeatherIcons.file,
          onTap: () {
            context.go(
              HomePage.routeName,
            );
          },
          childrens: [
            NavigationMenu(
              label: 'Profile',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Sign in',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Register',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Forget Password',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Error 404',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
          ],
        ),
        NavigationMenu(
          label: 'Components',
          icon: FeatherIcons.package,
          onTap: () {
            context.go(
              HomePage.routeName,
            );
          },
          childrens: [
            NavigationMenu(
              label: 'Charts',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Cards',
              onTap: () {
                context.go(
                  CardPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Buttons',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Forms',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Breadcrumb',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Carousel',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Alerts',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
          ],
        ),
        NavigationMenu(
          label: 'Help',
          icon: FeatherIcons.info,
          onTap: () {},
          childrens: [
            NavigationMenu(
              label: 'FAQ',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Technical Support',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
            NavigationMenu(
              label: 'Releases',
              onTap: () {
                context.go(
                  ButtonPage.routeName,
                );
              },
            ),
          ],
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
