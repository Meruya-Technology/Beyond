class DataUtil {
  static String toPulicRunTimeType(dynamic value, dynamic childType) {
    final stringType = value.runtimeType.toString();
    if (stringType.startsWith('_InternalLinkedHashMap')) {
      final childType = '<${stringType.split('<')[1]}';
      return 'Map$childType';
    }
    if (value is List) {
      return 'List<$childType>';
    }
    return stringType;
  }

  static bool isListOrMap(dynamic value) => value is List || value is Map;
}
