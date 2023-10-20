import 'package:flutter/material.dart';

class NavigationMenu {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  NavigationMenu({
    required this.label,
    required this.icon,
    this.onTap,
  });
}
