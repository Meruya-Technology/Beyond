import 'dart:convert';

import 'package:beyond_cli/src/core/entity/base_class.dart';
import 'package:beyond_cli/src/core/entity/base_class_property.dart';
import 'package:beyond_cli/src/utils/data_util.dart';
import 'package:beyond_cli/src/utils/text_util.dart';

class JsonUtil {
  final String? prefix;

  JsonUtil({
    this.prefix,
  });

  List<BaseClass> classes = [];

  static Map<dynamic, dynamic>? tryParse(String? rawJson) {
    if (rawJson == null) return null;
    try {
      final decoded = jsonDecode(rawJson);
      return decoded;
    } catch (e) {
      return null;
    }
  }

  List<BaseClass> segregateToClass(
    String className,
    Map<dynamic, dynamic> parsedJson,
  ) {
    final newClassName = (prefix != null) ? '${className}_$prefix' : className;

    /// Declare first file & class name
    final fileName = TextUtil.snakeCase(newClassName);
    final modifiedClassName = TextUtil.upperCamelCase(newClassName);

    /// Add class to classes, meanwhile createClassObject will loop is there any
    /// layer left to segregate
    classes.add(
      BaseClass(
        fileName: fileName,
        className: modifiedClassName,
        properties: createProperties(parsedJson),
        child: parsedJson,
        key: modifiedClassName,
      ),
    );

    /// Return classes as result
    return classes;
  }

  List<BaseClassProperty> createProperties(Map<dynamic, dynamic> json) {
    List<BaseClassProperty> properties = [];
    var keys = json.keys;

    /// Generate a properties map from keys
    /// 1. Property name
    /// 2. Original type (Map, List<T>, String, int, double, bool)
    /// 3. New type (T, List<T>) T on here can be model
    /// 4. Boolean is list or map
    /// 5. Children runtime type (T, or String, int, double, bool)
    /// 6. Map to model
    for (var key in keys) {
      /// First get child type
      var childType = DataUtil.getChildType(
        json[key],
        key,
        prefix: prefix,
      );

      /// Get the property key using proper case
      var propertyKey = TextUtil.camelCase(
        key,
      );

      /// Get the property converted type. Map will be converted to T, and
      /// List<Map> will converted to List<T>, and the rest remain the same
      var propertyType = DataUtil.toModelRunTimeType(
        json[key],
        childType,
      );

      /// Mark the property child list or map
      var isListOrMap = DataUtil.isListOrMap(
        json[key] is List ? json[key][0] : json[key],
      );

      /// Construct property to be added to properties
      final property = BaseClassProperty(
        name: propertyKey,
        type: propertyType,
        originalKey: key,
        isListOrMap: isListOrMap,
        childType: childType,
        mapToModel: DataUtil.isModelAble(
          json[key],
          childType,
        ),
        isAList: json[key] is List,
      );

      /// Add property to properties
      properties.add(property);

      /// Then check if the child is a Map<String, dynamic> repeat the process
      if (isListOrMap) {
        repeat(json, key);
      }
    }
    return properties;
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
    final newClassName = (prefix != null) ? '${parentKey}_$prefix' : parentKey;

    /// Declare first file & class name
    final fileName = TextUtil.snakeCase(newClassName);
    final modifiedClassName = TextUtil.upperCamelCase(newClassName);
    var firstJson = list.first;

    classes.add(
      BaseClass(
        fileName: fileName,
        className: modifiedClassName,
        properties: createProperties(firstJson),
        child: firstJson,
        key: parentKey,
      ),
    );
  }

  /// Convert map into class information
  void mapToClassInformation(String key, Map<dynamic, dynamic> json) {
    final newClassName = (prefix != null) ? '${key}_$prefix' : key;

    /// Declare first file & class name
    final fileName = TextUtil.snakeCase(newClassName);
    final modifiedClassName = TextUtil.upperCamelCase(newClassName);

    classes.add(
      BaseClass(
        fileName: fileName,
        className: modifiedClassName,
        properties: createProperties(json),
        child: json,
        key: key,
      ),
    );
  }
}
