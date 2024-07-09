import 'package:beyond_console/common/core/error_handler.dart';
import 'package:beyond_console/domain/repositories/utility_repository_impl.dart';
import 'package:beyond_console/domain/usecases/retrieve_ip_address.dart';
import 'package:beyond_console/domain/usecases/retrieve_socket_servers.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class UtilityFacade {
  static final _getIt = GetIt.instance;

  /// Dependencies
  static final _utilityRepository = UtilityRepositoryImpl(
    dioClient: _getIt.get<Dio>(),
  );

  final retrieveIpAddress = RetrieveIpAddress(
    errorHandler: _getIt.get<ErrorHandler>(),
    utilityRepository: _utilityRepository,
  );

  final retrieveSocketServers = RetrieveSocketServers(
    errorHandler: _getIt.get<ErrorHandler>(),
    utilityRepository: _utilityRepository,
  );
}
