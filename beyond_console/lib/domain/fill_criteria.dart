import 'package:beyond_console/domain/data_type.dart';

enum FillCriteria {
  increment,
  multiplier,
  random,
  empty;

  String get title => '${name[0].toUpperCase()}${name.substring(1)}';

  static List<FillCriteria>? chainedValues(DataType dataType) {
    switch (dataType) {
      case DataType.int:
        return values;
      case DataType.double:
        return values;
      case DataType.date:
        return values;
      case DataType.string:
        return [random];
      case DataType.bool:
        return [random];
      case DataType.list:
        return [random];
      default:
        return null;
    }
  }
}
