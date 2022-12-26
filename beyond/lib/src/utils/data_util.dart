class DataUtil {
  static bool isJsonAble(dynamic data) {
    if (data is String ||
        data is int ||
        data is double ||
        data is bool ||
        data is Object ||
        data is List ||
        data is Map ||
        data == null) {
      return true;
    }
    return false;
  }
}
