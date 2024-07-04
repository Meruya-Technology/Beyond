import 'custom_error.dart';

abstract class ErrorHandler {
  Future<CustomError> formatError(dynamic error);
}
