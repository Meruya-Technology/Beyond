class Field {
  /// Database field name
  final String? field;

  /// Json key, this value will override current format for specific json key
  /// that used when toJson or fromJson operation
  final String? key;

  /// Set isHidden to true, it will remove the associated field from json
  final bool isHidden;

  /// Set isFillable to false to make specific field ignored from insert or
  /// update operation
  final bool isFillable;

  /// Set isUpdateable to false to make specific field ignored from update
  /// operation
  final bool isUpdateable;

  /// A default value that returned to json when the associated field is null
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
