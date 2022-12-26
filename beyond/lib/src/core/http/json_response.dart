import 'dart:convert';

import 'package:shelf/shelf.dart';

class JsonResponse extends Response {
  final Map<String, String>? overrideHeaders;

  JsonResponse(
    super.statusCode, {
    Map<String, dynamic>? body,
    this.overrideHeaders,
    Encoding? encoding,
    Map<String, Object>? context,
  }) : super(
          body: body != null ? jsonEncode(body) : null,
          context: context,
          encoding: encoding,
          headers: newHeader(overrideHeaders),
        );

  /// Override old header value, and add if there is no header set
  static Map<String, String> newHeader(Map<String, String>? overrideHeaders) {
    Map<String, String> defaultHeaders = {
      "accept": "application/json",
      "content-type": "application/json",
    };

    /// If overrideHeaders field is not null, then override defaultHeaders
    if (overrideHeaders != null) {
      overrideHeaders.forEach((key, value) {
        final lowerKey = key.toLowerCase();
        defaultHeaders[lowerKey] = value;
      });
    }

    return defaultHeaders;
  }
}
