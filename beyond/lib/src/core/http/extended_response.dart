import 'dart:convert';

import 'package:shelf/shelf.dart';

class ExtendedResponse extends Response {
  final Object? body;

  ExtendedResponse(
    final int statusCode, {
    this.body,
  }) : super(
          statusCode,
          body: body,
        );

  Response copyWith({
    int? statusCode,
    Object? body,
    Map<String, Object>? headers,
    Encoding? encoding,
    Map<String, Object>? context,
  }) =>
      Response(
        statusCode ?? this.statusCode,
        body: body ?? this.body,
        headers: headers ?? this.headers,
        encoding: encoding ?? this.encoding,
        context: context ?? this.context,
      );
}
