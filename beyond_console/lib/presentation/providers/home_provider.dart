import 'package:beyond_console/domain/transaction_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/transaction.dart';

class HomeProvider extends ChangeNotifier {
  final currentTransactions = [
    Transaction(
      customerNumber: '123000456',
      nominal: 250000,
      status: TransactionStatus.success,
    ),
    Transaction(
      customerNumber: '123000456',
      nominal: 250000,
      status: TransactionStatus.pending,
    ),
    Transaction(
      customerNumber: '123000456',
      nominal: 250000,
      status: TransactionStatus.success,
    ),
    Transaction(
      customerNumber: '123000456',
      nominal: 250000,
      status: TransactionStatus.failed,
    ),
    Transaction(
      customerNumber: '123000456',
      nominal: 250000,
      status: TransactionStatus.success,
    ),
  ];
}

final homeProvider = ChangeNotifierProvider(
  (ref) => HomeProvider(),
);
