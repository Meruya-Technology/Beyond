import 'dart:convert';

class BaseResponse<T> {
  final String message;
  final T? data;

  BaseResponse({
    required this.message,
    this.data,
  });

  String toJson() {
    final json = {
      'message': message,
    };
    return jsonEncode(json);
  }
}
