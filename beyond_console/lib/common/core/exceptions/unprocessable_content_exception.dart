import 'package:beyond_console/common/core/custom_error.dart';

class UnprocessableContentException implements CustomError {
  final String title;
  final String message;

  UnprocessableContentException({
    this.message = 'Unprocessable Content',
    this.title = "server understands the content type of the request entity, "
        "and the syntax of the request entity is correct, but it was "
        "unable to process the contained instructions.",
  });

  @override
  StackTrace? get stackTrace => throw UnimplementedError();
}
