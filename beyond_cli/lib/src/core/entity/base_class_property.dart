class BaseClassProperty {
  final String name;
  final String originalType;
  final String newType;
  final String originalKey;
  final bool? isChildListOrMap;
  final String? childType;

  BaseClassProperty({
    required this.name,
    required this.originalType,
    required this.newType,
    required this.originalKey,
    this.isChildListOrMap,
    this.childType,
  });
}
