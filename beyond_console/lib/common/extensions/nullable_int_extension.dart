import '../const/values.dart';

extension NullableIntExtension on int? {
  String? get readable {
    if (this != null) {
      var unix = this ?? 0;
      var eventTime = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
      var formated = Values.longDateFormat.format(eventTime);
      return '$formated ${eventTime.timeZoneName}';
    }
    return null;
  }

  String get currencyFormat {
    var value = this ?? 0;
    return Values.idCurrencyFormat.format(value);
  }

  String? get nullableCurrencyFormat {
    if (this != null) {
      var value = this ?? 0;
      return Values.idCurrencyFormat.format(value);
    }
    return null;
  }

  String get thousandFormat {
    var value = this ?? 0;
    return Values.thousandFormat.format(value);
  }

  String get idFormat => currencyFormat;

  String? get unixToDate {
    var formatedDate = Values.dateFormat.format(
      Values.currentDate,
    );
    if (this != null) {
      var dateTime = DateTime.fromMillisecondsSinceEpoch(this!);
      formatedDate = Values.dateFormat.format(dateTime);
      return formatedDate;
    }
    return formatedDate;
  }

  String? get unixToTimeTz {
    var localTimeZone = Values.currentDate.toLocal().timeZoneName;
    if (this != null) {
      var parsedDate = DateTime.fromMillisecondsSinceEpoch(this!);
      localTimeZone =
          DateTime.fromMillisecondsSinceEpoch(this!).toLocal().timeZoneName;
      return '${Values.newTimeFormat.format(parsedDate)} '
          '$localTimeZone';
    }
    final currentTime = Values.newTimeFormat.format(
      Values.currentDate,
    );
    return '$currentTime $localTimeZone';
  }
}
