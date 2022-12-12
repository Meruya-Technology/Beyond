import 'dart:convert';

import 'package:beyond_cli/src/utils/data_util.dart';
import 'package:beyond_cli/src/utils/text_util.dart';

class JsonUtil {
  List<Map<dynamic, dynamic>> classes = [];

  static Map<dynamic, dynamic>? tryParse(String? rawJson) {
    if (rawJson == null) return null;
    try {
      final decoded = jsonDecode(rawJson);
      return decoded;
    } catch (e) {
      return null;
    }
  }

  List<Map<dynamic, dynamic>> segregateToClass(
    String className,
    Map<dynamic, dynamic> parsedJson,
  ) {
    /// Declare first class name
    var modifiedClassName = TextUtil.capital(className);

    /// Add class to classes, meanwhile createClassObject will loop is there any
    /// layer left to segregate
    classes.add({
      'className': modifiedClassName,
      'properties': createProperties(parsedJson),
      'child': parsedJson,
      'key': modifiedClassName
    });

    /// Return classes as result
    return classes;
  }

  List<Map<dynamic, dynamic>> createProperties(Map<dynamic, dynamic> json) {
    List<Map<dynamic, dynamic>> properties = [];
    var keys = json.keys;

    /// Doing loop per json keys
    for (var key in keys) {
      /// First get child type
      var childType = collectionTypeMapper(key, json[key]);
      var propertyKey = TextUtil.propercase(key.toString());
      var propertyValue = DataUtil.toPulicRunTimeType(
        json[key],
        childType,
      );
      var isChildListOrMap = DataUtil.isListOrMap(
        json[key] is List ? json[key][0] : json[key],
      );

      /// Construct property to be added to properties
      final property = {
        'name': propertyKey,
        'type': propertyValue,
        'originalKey': key,
        'isChildListOrMap': isChildListOrMap,
        'childType': childType
      };

      /// Add property to properties
      properties.add(property);

      /// Then check if the child is a Map<String, dynamic> repeat the process
      if (isChildListOrMap) {
        repeat(json, key);
      }
    }
    return properties;
  }

  String collectionTypeMapper(key, value) {
    var firstArray = value[0];
    return DataUtil.toPulicRunTimeType(firstArray, null);
  }

  /// Repeat the process
  void repeat(json, key) {
    /// First find it the json child is a list / map. If the json child is a
    /// list then convert it to class meanwhile if the child type is map convert
    /// it to map
    if (json[key] is List) {
      listToClassInformation(key, json[key]);
    } else {
      mapToClassInformation(key, json[key]);
    }
  }

  /// Convert List<anything> into class information
  void listToClassInformation(String parentKey, List<dynamic> list) {
    var firstJson = list.first;
    classes.add({
      'className': TextUtil.capital(parentKey),
      'properties': createProperties(firstJson),
      'child': firstJson,
      'key': parentKey
    });
  }

  /// Convert map into class information
  void mapToClassInformation(String key, Map<dynamic, dynamic> json) {
    classes.add({
      'className': TextUtil.capital(key),
      'properties': createProperties(json),
      'child': json,
      'key': key
    });
  }
}
