import 'package:beyond_console/presentation/pages/home_page.dart';
import 'package:beyond_console/presentation/providers/dashboard_provider.dart';
import 'package:beyond_console/presentation/widgets/side_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerWidget {
  static const routeName = '/';

  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(dashboardProvider);
    return Scaffold(
      body: buildBody(context, provider),
    );
  }

  Widget buildBody(BuildContext context, DashboardProvider provider) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSideBar(
          context,
          provider,
        ),
        const Expanded(
          child: HomePage(),
        ),
      ],
    );
  }

  Widget buildSideBar(BuildContext context, DashboardProvider provider) {
    return SideNavigationBar(
      navigationMenus: provider.navigationMenus,
    );
  }
}
