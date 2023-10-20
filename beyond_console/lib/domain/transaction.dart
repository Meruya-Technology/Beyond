import 'package:beyond_console/domain/transaction_status.dart';

class Transaction {
  final String customerNumber;
  final int nominal;
  final TransactionStatus status;

  Transaction({
    required this.customerNumber,
    required this.nominal,
    required this.status,
  });
}
