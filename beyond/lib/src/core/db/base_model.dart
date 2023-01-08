abstract class BaseModel {
  /// Convert class into map, for json operation. Right now this method only
  /// support for non nested class / json
  Map<String, dynamic> toMap();
}
