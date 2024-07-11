import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/core/error_handler.dart';
import '../../common/core/error_handler_impl.dart';

class MainFacade {
  static final getIt = GetIt.instance;

  /// Initializes the necessary components for the application.
  ///
  /// This function is responsible for initializing the internet checker,
  /// error handler, and Dio client. It does this by calling the
  /// `initializeInternetChecker`, `initializeErrorHandler`, and
  /// `initializeDioClient` functions respectively.
  ///
  /// This function returns a `Future<void>` which completes when all the
  /// initialization tasks are completed.
  static Future<void> initialize() async {
    await initializeErrorHandler();
    await initializeDioClient();
    await initializeSharedPreferences();
  }

  static Future<void> initializeErrorHandler() async {
    final errorHandler = ErrorHandlerImpl();

    getIt.registerSingleton<ErrorHandler>(
      errorHandler,
    );
  }

  static Future<void> initializeDioClient() async {
    const timeOutDuration = Duration(minutes: 1);

    final dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(
          milliseconds: timeOutDuration.inMilliseconds,
        ),
        sendTimeout: Duration(
          milliseconds: timeOutDuration.inMilliseconds,
        ),
        receiveTimeout: Duration(
          milliseconds: timeOutDuration.inMilliseconds,
        ),
      ),
    );

    getIt.registerSingleton<Dio>(
      dio,
    );
  }

  static Future<void> initializeSharedPreferences() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(prefs);
  }
}
