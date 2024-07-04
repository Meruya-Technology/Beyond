import 'package:beyond_console/common/const/data_formats.dart';

extension NullableIntExtension on int? {
  String? get readable {
    if (this != null) {
      var unix = this ?? 0;
      var eventTime = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
      var formated = DataFormats.longDateFormat.format(eventTime);
      return '$formated ${eventTime.timeZoneName}';
    }
    return null;
  }

  String get currencyFormat {
    var value = this ?? 0;
    return DataFormats.currencyFormat.format(value);
  }

  String? get nullableCurrencyFormat {
    if (this != null) {
      var value = this ?? 0;
      return DataFormats.currencyFormat.format(value);
    }
    return null;
  }

  String get thousandFormat {
    var value = this ?? 0;
    return DataFormats.thousandFormat.format(value);
  }

  String get idFormat => currencyFormat;

  String? get unixToDate {
    var formatedDate = DataFormats.dateFormat.format(
      DataFormats.currentDate,
    );
    if (this != null) {
      var dateTime = DateTime.fromMillisecondsSinceEpoch(this!);
      formatedDate = DataFormats.dateFormat.format(dateTime);
      return formatedDate;
    }
    return formatedDate;
  }

  String? get unixToTimeTz {
    var localTimeZone = DataFormats.currentDate.toLocal().timeZoneName;
    if (this != null) {
      var parsedDate = DateTime.fromMillisecondsSinceEpoch(this!);
      localTimeZone =
          DateTime.fromMillisecondsSinceEpoch(this!).toLocal().timeZoneName;
      return '${DataFormats.newTimeFormat.format(parsedDate)} '
          '$localTimeZone';
    }
    final currentTime = DataFormats.newTimeFormat.format(
      DataFormats.currentDate,
    );
    return '$currentTime $localTimeZone';
  }

  String? get fullDayName {
    switch (this) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return null;
    }
  }
}
