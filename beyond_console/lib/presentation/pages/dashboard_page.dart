import 'package:beyond_console/common/utils/screen_util.dart';
import 'package:beyond_console/presentation/providers/dashboard_provider.dart';
import 'package:beyond_console/presentation/widgets/layout/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/layout/header.dart';

class DashboardPage extends ConsumerWidget {
  static const routeName = '/';
  final Widget child;

  const DashboardPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(dashboardProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: buildBody(
            context,
            provider,
            constraints,
          ),
        );
      },
    );
  }

  Widget buildBody(
    BuildContext context,
    DashboardProvider provider,
    BoxConstraints constraints,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSideBar(
          context,
          provider,
        ),
        Expanded(
          child: Column(
            children: [
              const Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding: ScreenUtil.getBodyPadding(
                      constraints.maxWidth,
                    ),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSideBar(BuildContext context, DashboardProvider provider) {
    return SideBar(
      navigationMenus: provider.navigationMenus(context),
    );
  }
}
