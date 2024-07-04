import 'package:flutter/material.dart';

import '../../../common/const/dimensions.dart';

class SideBarTile extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final IconData? icon;

  const SideBarTile({
    super.key,
    this.onTap,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.s,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: icon != null,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: Dimensions.xs,
                  ),
                  child: Icon(
                    icon,
                    size: Dimensions.m,
                  ),
                ),
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
