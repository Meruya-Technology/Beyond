import 'package:beyond_cli/src/utils/text_util.dart';

class ModelSample {
  static String buildClassString(
    Map<dynamic, dynamic> classMap,
  ) {
    var innerConstructors = '';
    var outterConstructors = '';
    var fromJson = '';
    var toJson = '';
    final className = classMap['className'];
    final properties = classMap['properties'] as List<Map<dynamic, dynamic>>;
    for (var i = 0; i < properties.length; i++) {
      final property = properties[i];
      innerConstructors += '\tfinal ${property['type']} ${property['name']};\n';
      outterConstructors += '\t\trequired this.${property['name']},';
      // Divide if object is a list
      if (property['isChildListOrMap']) {
        final isList = (property['type'] as String).startsWith('List');
        final isChildObject =
            (property['childType'] as String).startsWith('Map');
        final childClassName = TextUtil.upperCamelCase(property['name']);
        if (isList && isChildObject) {
          fromJson +=
              '''\t\t${property['name']} : ${property['type']}.from(json['${property['originalKey']}'].map((json)=>$childClassName.fromJson(json['${property['originalKey']}']))),\n''';
          toJson +=
              '''\t\tjson['${property['originalKey']}'] = ${property['name']}.map((model) => model.toJson()).toList();''';
        } else if (isList) {
          fromJson +=
              '''\t\t${property['name']} : json['${property['originalKey']}'].cast<List<${property['childType']}>>(),\n''';
          toJson +=
              '''\t\tjson['${property['originalKey']}'] = ${property['name']};''';
        } else {
          fromJson +=
              '''\t\t${property['name']} : $childClassName.fromJson(json),\n''';
          toJson +=
              '''\t\tjson['${property['originalKey']}'] = ${property['name']}.toJson();''';
        }
      } else {
        fromJson +=
            '''\t\t${property['name']} : json['${property['originalKey']}'],\n''';
        toJson +=
            '''\t\tjson['${property['originalKey']}'] = ${property['name']};''';
      }
      if (((i + 1) != properties.length)) {
        outterConstructors += '\n';
        toJson += '\n';
      }
    }

    var fromJsonTemplate =
        '\n\tfactory $className.fromJson(Map<String, dynamic> json) => $className(\n$fromJson\t);\n';
    var toJsonTemplate =
        '\tMap<String, dynamic> toJson() {\n\t\tfinal Map<String, dynamic> json = <String, dynamic>{};\n$toJson\n\t\treturn json;\n\t}';
    var constructorTemplate =
        '$innerConstructors\n\t$className({\n$outterConstructors\n\t});';
    var classTemplate =
        'class $className {\n$constructorTemplate\n$fromJsonTemplate\n$toJsonTemplate\n}';
    return classTemplate;
  }
}
