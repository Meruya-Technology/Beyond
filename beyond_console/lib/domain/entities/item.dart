import 'package:flutter/material.dart';

class Item {
  final String name;
  final int totalSales;
  final int sold;
  final int stock;
  final String category;
  final IconData categoryIcon;
  final Color categoryIconColor;

  Item({
    required this.name,
    required this.totalSales,
    required this.sold,
    required this.stock,
    required this.category,
    required this.categoryIcon,
    required this.categoryIconColor,
  });
}
