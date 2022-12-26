import 'dart:mirrors';

import 'package:beyond/src/utils/text_util.dart';
import 'package:collection/collection.dart';

import '../core/annotations/field.dart';
import '../core/annotations/table.dart';

class MirrorUtil {
  final dynamic targetClass;
  MirrorUtil(this.targetClass);

  /// Get tableName from metadata, if the metadata empty it will generate new
  /// plural name from child class runtimetype
  String get tableName {
    /// Get new table name from metadata
    final newTableName = tableMetadata?.name;
    if (newTableName != null) return newTableName;

    /// Get default table name from class runtimetype lowercased & pluralized
    final defaultTableName = TextUtil.makePlural(
      runtimeType.toString().toLowerCase(),
    );

    /// Return default table name if table name on metadata is null
    return defaultTableName;
  }

  String? get tableSchema {
    return tableMetadata?.schema;
  }

  /// Get child class annotation, in this case Metadata class
  Table? get tableMetadata {
    final tableMetadata = classMirror.metadata.singleWhereOrNull(
      (e) => e.reflectee is Table,
    );
    return tableMetadata?.reflectee;
  }

  /// Get field metadata
  Field? getField(VariableMirror variable) {
    if (variable.metadata.isEmpty) {
      return null;
    }
    return variable.metadata
        .singleWhereOrNull((metadata) => metadata.reflectee is Field)
        ?.reflectee;
  }

  /// Get child class mirror
  ClassMirror get classMirror =>
      (targetClass is Type) ? reflectClass(targetClass) : instanceMirror.type;

  /// Get child class instance
  InstanceMirror get instanceMirror => reflect(targetClass);

  /// Get child class methods through List<MethodMirror>
  List<MethodMirror> get methods {
    List<MethodMirror> result = [];
    classMirror.declarations.forEach((key, value) {
      if (value is MethodMirror) {
        result.add(value);
      }
    });
    return result;
  }

  /// Get child class variables through List<VariableMirror>
  List<VariableMirror> get variables {
    List<VariableMirror> result = [];
    classMirror.declarations.forEach((key, value) {
      if (value is VariableMirror) {
        result.add(value);
      }
    });
    return result;
  }
}
