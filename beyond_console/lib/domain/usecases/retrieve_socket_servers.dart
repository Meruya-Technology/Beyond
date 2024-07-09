import 'package:beyond_console/common/core/error_handler.dart';
import 'package:beyond_console/domain/repositories/utility_repository.dart';

import '../../common/core/usecase.dart';
import '../params/retrieve_socket_servers_param.dart';

class RetrieveSocketServers
    extends UseCase<List<String>?, RetrieveSocketServersParam> {
  final UtilityRepository _utilityRepository;
  final ErrorHandler _errorHandler;

  RetrieveSocketServers({
    required UtilityRepository utilityRepository,
    required ErrorHandler errorHandler,
  })  : _utilityRepository = utilityRepository,
        _errorHandler = errorHandler;

  @override
  Future<List<String>?> build(RetrieveSocketServersParam params) async {
    final result = _utilityRepository.retrieveSocketServers(
      ipAddress: params.ipAddress,
      socketPort: params.socketPort,
    );
    return result;
  }

  @override
  ErrorHandler errorHandler() => _errorHandler;
}
