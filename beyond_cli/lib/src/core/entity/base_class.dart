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
}
