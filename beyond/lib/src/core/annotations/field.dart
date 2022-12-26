class Field {
  /// Database field name
  final String? field;

  /// Json key, this value will override current format for specific json key
  /// that used when toJson or fromJson operation
  final String? key;
  final bool isHidden;
  final bool isFillable;
  final bool isUpdateable;
  final dynamic defaultValue;

  const Field({
    this.field,
    this.key,
    this.isHidden = false,
    this.isFillable = true,
    this.isUpdateable = true,
    this.defaultValue,
  });
}
