import 'package:intl/intl.dart';

class DataFormats {
  static final currencyFormat = NumberFormat('\$#,##0', 'en_US');
  static final thousandFormat = NumberFormat('\$#,##0', 'en_US');
  static final dateFormat = DateFormat('dd MMM yyyy');
  static final currentDate = DateTime.now();
  static final newTimeFormat = DateFormat('HH:mm');
  static final longDateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');
}
