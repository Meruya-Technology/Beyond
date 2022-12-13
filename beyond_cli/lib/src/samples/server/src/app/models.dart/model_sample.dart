import 'package:beyond_cli/src/core/base_class.dart';
import 'package:beyond_cli/src/utils/text_util.dart';

class ModelSample {
  static String build(BaseClass classObject) {
    var innerConstructors = '';
    var outterConstructors = '';
    var tempFromJson = '';
    var tempToJson = '';
    final className = classObject.className;
    final properties = classObject.properties;

    for (var i = 0; i < properties.length; i++) {
      final property = properties[i];
      final childClassName = TextUtil.upperCamelCase(property.name);
      final isList = property.newType.startsWith('List');
      final isChildObject = (property.childType as String).startsWith('Map');
      final mapToModel = isList && isChildObject;

      innerConstructors += '\tfinal ${property.newType} ${property.name};\n';
      outterConstructors += '\t\trequired this.${property.name},';
      tempFromJson += fromJson(
        jsonKey: property.originalKey,
        name: property.name,
        type: property.newType,
        childClassName: childClassName,
        childType: property.childType,
        isAList: isList,
        mapAsModel: mapToModel,
      );
      tempToJson += toJson(
        jsonKey: property.originalKey,
        name: property.name,
        type: property.newType,
        childClassName: childClassName,
        childType: property.childType,
        isAList: isList,
        mapAsModel: mapToModel,
      );

      // Divide if object is a list
      // if (property.isChildListOrMap ?? false) {

      //   if (isList && isChildObject) {
      //     fromJson +=
      //         '''\t\t${property.name} : ${property.type}.from(json['${property.originalKey}'].map((json)=>$childClassName.fromJson(json['${property.originalKey}']),),),\n''';
      //     toJson +=
      //         '''\t\tjson['${property.originalKey}'] = ${property.name}.map((model) => model.toJson()).toList();''';
      //   } else if (isList) {
      //     fromJson +=
      //         '''\t\t${property.name} : json['${property.originalKey}'].cast<List<${property.childType}>>(),\n''';
      //     toJson +=
      //         '''\t\tjson['${property.originalKey}'] = ${property.name};''';
      //   } else {
      //     fromJson +=
      //         '''\t\t${property.name} : $childClassName.fromJson(json),\n''';
      //     toJson +=
      //         '''\t\tjson['${property.originalKey}'] = ${property.name}.toJson();''';
      //   }
      // } else {
      //   fromJson +=
      //       '''\t\t${property.name} : json['${property.originalKey}'],\n''';
      //   toJson += '''\t\tjson['${property.originalKey}'] = ${property.name};''';
      // }
    }

    var fromJsonTemplate =
        '\n\tfactory $className.fromJson(Map<String, dynamic> json) => $className(\n$tempFromJson\t);\n';
    var toJsonTemplate =
        '\tMap<String, dynamic> toJson() {\n\t\tfinal Map<String, dynamic> json = <String, dynamic>{};\n$tempToJson\n\t\treturn json;\n\t}';
    var constructorTemplate =
        '$innerConstructors\n\t$className({\n$outterConstructors\n\t});';

    return classEnclosure(
      className,
      constructorTemplate,
      fromJsonTemplate,
      toJsonTemplate,
    );
  }

  static String classEnclosure(
    String className,
    String constructor,
    String fromJson,
    String toJson,
  ) {
    return '''class $className {$constructor$fromJson$toJson}''';
  }

  static String fromJson({
    required String name,
    required String type,
    required String jsonKey,
    String? childClassName,
    String? childType,
    bool mapAsModel = false,
    bool isAList = false,
  }) {
    /// 1. Check if it required to map as a model
    ///    1.1. Check if its a list then map it to list model
    ///    1.2. If it is just a map then map it to model
    /// 2. Check if isn't required to map as a model
    ///    2.1. Check if its a list, then cast into List<T>
    ///    2.2. If it isn't a list then just put it on the class
    if (mapAsModel) {
      if (isAList) {
        return '''$name : $type.from(json['$jsonKey'].map(
        (json) => $childClassName.fromJson(json['$jsonKey']),),),''';
      } else {
        return '''$name : $childClassName.fromJson(json),''';
      }
    } else {
      if (isAList) {
        return '''$name : json['$jsonKey'].cast<List<$childType>>(),''';
      } else {
        return '''$name : json['$jsonKey'],''';
      }
    }
  }

  static String toJson({
    required String name,
    required String type,
    required String jsonKey,
    String? childClassName,
    String? childType,
    bool mapAsModel = false,
    bool isAList = false,
  }) {
    /// 1. Check if it required to map as a model
    ///    1.1. Check if its a list then map it to list model
    ///    1.2. If it is just a map then map it to model
    /// 2. Check if isn't required to map as a model then just put it
    ///    on the json
    if (mapAsModel) {
      if (isAList) {
        return '''json['$jsonKey'] = $name.map(
          (model) => model.toJson()).toList();''';
      } else {
        return '''json['$jsonKey'] = $name.toJson();''';
      }
    } else {
      return '''json['$jsonKey'] = $name;''';
    }
  }
}
