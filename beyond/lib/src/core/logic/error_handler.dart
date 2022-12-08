import 'package:shelf/shelf.dart';

abstract class ErrorHandler {
  Future<Response> formatError(dynamic error);
}
