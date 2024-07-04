import 'package:beyond_console/common/core/custom_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'error_handler.dart';
import 'exceptions/bad_request_exception.dart';
import 'exceptions/forbidden_exception.dart';
import 'exceptions/not_found_exception.dart';
import 'exceptions/server_exception.dart';
import 'exceptions/unauthorized_exception.dart';

import 'exceptions/unhandled_exception.dart';
import 'exceptions/unprocessable_content_exception.dart';

class ErrorHandlerImpl implements ErrorHandler {
  @override
  Future<CustomError> formatError(error) async {
    debugPrint('[ERROR HANDLER] Formatting error : $error');

    if (error is DioException) {
      return await dioError(error.response?.statusCode);
    } else {
      return UnhandledException(
        message: error.toString(),
      );
    }
  }

  Future<CustomError> dioError(int? statusCode) async {
    switch (statusCode) {
      case 400:
        return BadRequestException();
      case 401:
        return UnauthorizedException();
      case 403:
        return ForbiddenException();
      case 404:
        return NotFoundException();
      case 422:
        return UnprocessableContentException();
      case 500:
        return ServerException();
      default:
        return UnhandledException();
    }
  }
}
