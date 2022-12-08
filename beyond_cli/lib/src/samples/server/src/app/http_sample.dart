class HttpSample {
  static String get content => '''
import 'dart:async';
import 'package:shelf/shelf.dart';
import 'api.dart';

/// This class is constructing pipeline, and add the middleware, also
/// the router handler into the pipeline. Then the final handler can be called
/// to server a http event
class Http {
  final List<Middleware> middlewares;
  final Api api;

  Http(
    this.middlewares,
    this.api,
  );

  Pipeline get pipeline {
    final localPipeline = Pipeline();
    for (var middleware in middlewares) {
      localPipeline.addMiddleware(middleware);
    }
    return localPipeline;
  }

  FutureOr<Response> Function(Request) get handler => pipeline.addHandler(
        api.getRoutes,
      );
}
''';
}
