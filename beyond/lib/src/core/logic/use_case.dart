import 'package:shelf/shelf.dart';

abstract class UseCase<T> {
  Future<Response> build(T data);

  Future<Response> execute(T data) async {
    return await build(data).catchError(
      (error) => handleError(error),
    );
  }

  Future<Response> handleError(dynamic error);
}
