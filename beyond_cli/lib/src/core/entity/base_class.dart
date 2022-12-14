import 'base_class_property.dart';

class BaseClass {
  final String fileName;
  final String className;
  final List<BaseClassProperty> properties;
  final Map<dynamic, dynamic>? child;
  final String key;

  BaseClass({
    required this.fileName,
    required this.className,
    required this.properties,
    this.child,
    required this.key,
  });

  Map<String, dynamic> get manifest => {
        'fileName': fileName,
        'className': className,
        'propertiesLength': properties.length,
        'properties': properties.map((property) => property.manifest).toList(),
        'child': child,
        'key': key,
      };
}
