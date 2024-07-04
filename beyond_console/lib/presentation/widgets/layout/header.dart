import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../../common/const/dimensions.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.onBackground.withOpacity(0.05),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.l,
        vertical: Dimensions.m,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                iconSize: 18,
                icon: const Badge(
                  child: Icon(
                    FeatherIcons.bell,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              MenuAnchor(
                alignmentOffset: const Offset(-Dimensions.xl, Dimensions.xs),
                style: const MenuStyle(
                  alignment: Alignment.bottomLeft,
                ),
                builder: (
                  BuildContext context,
                  MenuController controller,
                  Widget? child,
                ) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        'https://hackernoon.imgix.net/images/bfqrt3x6hAVgXkezEqVTPC5AAFA2-lbc3lp3.jpeg',
                      ),
                    ),
                  );
                },
                menuChildren: [
                  MenuItemButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: Dimensions.m,
                          vertical: Dimensions.xs,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    leadingIcon: const Icon(
                      FeatherIcons.user,
                      size: 16,
                    ),
                    child: const Text('Profile'),
                  ),
                  MenuItemButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: Dimensions.m,
                          vertical: Dimensions.xs,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    leadingIcon: const Icon(
                      FeatherIcons.logOut,
                      size: 16,
                    ),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
