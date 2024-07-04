import 'package:flutter/material.dart';

class NavigationMenu {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final List<NavigationMenu>? childrens;

  NavigationMenu({
    required this.label,
    this.icon,
    this.onTap,
    this.childrens,
  });
}
