import 'package:beyond_console/common/core/custom_error.dart';

class NoInternetException implements CustomError {
  final String title;
  final String message;

  NoInternetException({
    this.message = 'No Internet Connection',
    this.title =
        "It seems you are offline. Please check your internet connection.",
  });

  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}
