import 'dart:mirrors';

import 'package:beyond/src/utils/text_util.dart';

import '../core/entities/condition.dart';
import 'mirror_util.dart';

class DBUtil {
  final MirrorUtil mirror;

  DBUtil({
    required this.mirror,
  });

  /// Create payload from reflection. So the beyond user doesnt have to
  /// re-create toJson / toMap method everytime :)
  Map<String, dynamic> get singleInsertPayload {
    Map<String, dynamic> payload = {};
    for (var variable in mirror.variables) {
      /// Construct variable name
      final variableName = TextUtil.snakeCase(
        MirrorSystem.getName(variable.simpleName),
      );

      /// Construct variable value
      final variableValue = mirror.instanceMirror.getField(
        variable.simpleName,
      );

      /// Get field metadata
      final field = mirror.getField(variable);

      /// If field is fillable then add them to payload
      if (field?.isFillable ?? true) {
        payload[variableName] = variableValue.reflectee;
      }
    }
    return payload;
  }

  /// Create payload from reflection. So the beyond user doesnt have to
  /// re-create toJson / toMap method everytime :)
  Map<String, dynamic> get updatePayload {
    Map<String, dynamic> payload = {};
    for (var variable in mirror.variables) {
      /// Construct variable name
      final variableName = TextUtil.snakeCase(
        MirrorSystem.getName(variable.simpleName),
      );

      /// Construct variable value
      final variableValue = mirror.instanceMirror.getField(
        variable.simpleName,
      );

      /// Get field metadata
      final field = mirror.getField(variable);

      /// If field is fillable then add them to payload
      if (field?.isUpdateable ?? true) {
        payload[variableName] = variableValue.reflectee;
      }
    }
    return payload;
  }

  Map<String, dynamic> mapSelectOutput(Map<String, dynamic>? row) {
    Map<String, dynamic> payload = {};
    for (var variable in mirror.variables) {
      /// Construct variable name
      final key = MirrorSystem.getName(variable.simpleName);
      final dbField = TextUtil.snakeCase(key);

      /// Get field metadata
      final field = mirror.getField(variable);

      /// If field is fillable then add them to payload
      final isHidden = !(field?.isHidden ?? false);
      if (isHidden) {
        if (row?[dbField] is DateTime) {
          payload[key] = (row?[dbField] as DateTime).toIso8601String();
        } else {
          payload[key] = row?[dbField];
        }
      }
    }
    return payload;
  }

  /// Select, delete operation
  Map<String, dynamic>? mapConditionToPayload(List<Condition>? conditions) {
    /// If the condition paramerter is null then return null
    if (conditions == null) return null;

    /// If the given condition is exsis then continue to map
    Map<String, dynamic> payload = {};
    for (var condition in conditions) {
      payload[condition.field] = condition.value;
    }
    return payload;
  }
}
