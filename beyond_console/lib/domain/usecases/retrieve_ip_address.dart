import 'package:beyond_console/common/core/error_handler.dart';
import 'package:beyond_console/domain/repositories/utility_repository.dart';

import '../../common/core/usecase.dart';

class RetrieveIpAddress extends UseCase<String?, Null> {
  final UtilityRepository _utilityRepository;
  final ErrorHandler _errorHandler;

  RetrieveIpAddress({
    required UtilityRepository utilityRepository,
    required ErrorHandler errorHandler,
  })  : _utilityRepository = utilityRepository,
        _errorHandler = errorHandler;

  @override
  Future<String?> build(Null params) async {
    final result = _utilityRepository.retrieveIpAddress();
    return result;
  }

  @override
  ErrorHandler errorHandler() => _errorHandler;
}
