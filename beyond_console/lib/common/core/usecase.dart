import 'error_handler.dart';

abstract class UseCase<Type, Params> {
  Future<Type> build(Params params);

  ErrorHandler errorHandler();

  Future<Type> execute(Params params) {
    return build(params).catchError(errorProcessing);
  }

  Future<Type> errorProcessing(dynamic error) async {
    throw (await errorHandler().formatError(error));
  }
}
