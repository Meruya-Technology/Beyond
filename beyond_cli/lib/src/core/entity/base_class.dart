import 'base_class_property.dart';

class BaseClass {
  final String className;
  final List<BaseClassProperty> properties;
  final Map<dynamic, dynamic>? child;
  final String key;

  BaseClass({
    required this.className,
    required this.properties,
    this.child,
    required this.key,
  });
}
