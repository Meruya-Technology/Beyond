import 'package:flutter/material.dart';

class Order {
  final Color color;
  final String name;
  final IconData icon;
  final double percentage;
  final int amount;

  Order({
    required this.color,
    required this.name,
    required this.icon,
    required this.amount,
    required this.percentage,
  });
}
