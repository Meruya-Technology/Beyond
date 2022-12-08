import 'package:shelf/shelf.dart';

abstract class UseCase {
  Future<Response> build(Request req);

  Future<Response> execute(Request req) async {
    return await build(req).catchError(
      (error) => handleError(error),
    );
  }

  Future<Response> handleError(dynamic error);
}
