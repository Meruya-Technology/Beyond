import 'dart:io';

import 'package:beyond_cli/src/utils/text_util.dart';

class DataUtil {
  static String toPulicRunTimeType(dynamic value, dynamic childType) {
    final stringType = value.runtimeType.toString();
    if (value is Map) {
      final childType = '<${stringType.split('<')[1]}';
      return 'Map$childType';
    } else if (value is List) {
      return 'List<$childType>';
    }
    return stringType;
  }

  static String toModelRunTimeType(dynamic value, dynamic childType) {
    final stringType = value.runtimeType.toString();
    if (value is Map) {
      return childType;
    } else if (value is List) {
      return 'List<$childType>';
    }
    return stringType;
  }

  static String getChildType(
    dynamic value,
    String key, {
    String? prefix,
  }) {
    final newTypeName =
        (prefix != null) ? '$key${TextUtil.upperCamelCase(prefix)}' : key;
    if (value is Map) {
      return TextUtil.upperCamelCase(newTypeName);
    } else if (value is List) {
      final firstElement = value.first;
      return (firstElement is Map)
          ? TextUtil.upperCamelCase(newTypeName)
          : firstElement.runtimeType.toString();
    }
    return 'Null';
  }

  static bool isModelAble(dynamic value, String childType) {
    stdout.writeln('${value.runtimeType} $childType');
    if (value is Map) {
      return true;
    } else if (value is List) {
      if (childType == 'Null' ||
          childType == 'int' ||
          childType == 'String' ||
          childType == 'bool') {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static bool isListOrMap(dynamic value) => value is List || value is Map;
}
