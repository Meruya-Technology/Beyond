import 'package:flutter/material.dart';

import '../params/navigation_menu.dart';

class SideNavigationBar extends StatelessWidget {
  final List<NavigationMenu> navigationMenus;

  const SideNavigationBar({
    required this.navigationMenus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(
          24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Beyond',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 48,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: navigationMenus[index].onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        navigationMenus[index].icon,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        navigationMenus[index].label,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: navigationMenus.length,
            ),
          ],
        ),
      ),
    );
  }
}
