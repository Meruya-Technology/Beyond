import 'package:flutter/material.dart';

enum TransactionStatus {
  success,
  pending,
  failed;

  Color? get color {
    switch (this) {
      case success:
        return Colors.green;
      case failed:
        return Colors.red;
      case pending:
        return Colors.orange;
      default:
        return Colors.grey[300];
    }
  }
}
