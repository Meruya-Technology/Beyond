import 'package:beyond_console/common/const/dimensions.dart';
import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../params/navigation_menu.dart';
import '../composables/side_bar_tile.dart';

class SideBar extends StatelessWidget {
  final List<NavigationMenu> navigationMenus;

  const SideBar({
    required this.navigationMenus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.onBackground.withOpacity(0.05),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Dimensions.l,
                Dimensions.l,
                Dimensions.l,
                Dimensions.m,
              ),
              child: Text(
                'Beyond',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            listNavigation(context),
          ],
        ),
      ),
    );
  }

  Widget listNavigation(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(
          Dimensions.l,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: Dimensions.s,
        ),
        itemBuilder: (context, index) => navigationTile(
          context,
          navigationMenus[index],
        ),
        itemCount: navigationMenus.length,
      ),
    );
  }

  Widget navigationTile(
    BuildContext context,
    NavigationMenu navigationMenu,
  ) {
    return Visibility(
      visible: navigationMenu.childrens != null,
      replacement: SideBarTile(
        label: navigationMenu.label,
        icon: navigationMenu.icon,
        onTap: navigationMenu.onTap,
      ),
      child: Theme(
        data: context.theme.copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: ExpansionTile(
            clipBehavior: Clip.antiAlias,
            backgroundColor: context.colorScheme.background,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            collapsedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(
                // horizontal: Dimensions.s,
                vertical: 0,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: Dimensions.xs,
                    ),
                    child: Icon(
                      navigationMenu.icon,
                      size: Dimensions.m,
                    ),
                  ),
                  Text(navigationMenu.label),
                ],
              ),
            ),
            tilePadding: const EdgeInsets.symmetric(
              horizontal: Dimensions.s,
              vertical: 0,
            ),
            childrenPadding: const EdgeInsets.symmetric(
              horizontal: Dimensions.m,
              vertical: Dimensions.xxs,
            ),
            visualDensity: VisualDensity.compact,
            children: (navigationMenu.childrens != null)
                ? navigationMenu.childrens!
                    .map(
                      (children) => SideBarTile(
                        onTap: children.onTap,
                        icon: children.icon,
                        label: children.label,
                      ),
                    )
                    .toList()
                : [],
          ),
        ),
      ),
    );
  }
}
