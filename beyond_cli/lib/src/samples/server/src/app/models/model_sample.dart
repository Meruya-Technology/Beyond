import 'package:beyond_cli/src/core/entity/base_class.dart';
import 'package:beyond_cli/src/utils/text_util.dart';

class ModelSample {
  static String build(BaseClass classObject) {
    var import = '';
    var innerConstructors = '';
    var outterConstructors = '';
    var tempFromJson = '';
    var tempToJson = '';
    final className = classObject.className;
    final properties = classObject.properties;

    for (var i = 0; i < properties.length; i++) {
      final property = properties[i];

      /// If the property need to map to model, then import the required model
      if (property.mapToModel) {
        final file = TextUtil.snakeCase(
          property.childType ?? property.type,
        );
        import += "import '$file.dart';\n";
      }

      innerConstructors += '\tfinal ${property.type} ${property.name};\n';
      outterConstructors += '\t\trequired this.${property.name},';
      tempFromJson += fromJson(
        jsonKey: property.originalKey,
        name: property.name,
        type: property.type,
        childType: property.childType,
        isAList: property.isAList,
        mapAsModel: property.mapToModel,
      );
      tempToJson += toJson(
        jsonKey: property.originalKey,
        name: property.name,
        type: property.type,
        childType: property.childType,
        isAList: property.isAList,
        mapAsModel: property.mapToModel,
      );
    }

    var fromJsonTemplate = '''factory $className.fromJson(
          Map<String, dynamic> json) => $className($tempFromJson);''';
    var toJsonTemplate = '''Map<String, dynamic> toJson() {
      final json = <String, dynamic>{}; $tempToJson return json;}''';
    var constructorTemplate =
        '$innerConstructors \n $className({$outterConstructors});';

    return buildClass(
      import,
      className,
      constructorTemplate,
      fromJsonTemplate,
      toJsonTemplate,
    );
  }

  static String buildClass(
    String import,
    String className,
    String constructor,
    String fromJson,
    String toJson,
  ) {
    return '$import \n class $className {$constructor \n\n $fromJson \n\n $toJson}';
  }

  static String fromJson({
    required String name,
    required String type,
    required String jsonKey,
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
        (json) => $childType.fromJson(json),),),''';
      } else {
        return '''$name : $childType.fromJson(json),''';
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
