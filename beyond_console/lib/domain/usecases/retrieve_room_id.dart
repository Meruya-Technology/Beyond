import 'package:beyond_console/domain/repositories/beyond_repository.dart';

import '../../common/core/error_handler.dart';
import '../../common/core/usecase.dart';

class RetrieveRoomId extends UseCase<String?, Null> {
  final BeyondRepository _beyondRepository;
  final ErrorHandler _errorHandler;

  RetrieveRoomId({
    required BeyondRepository beyondRepository,
    required ErrorHandler errorHandler,
  })  : _beyondRepository = beyondRepository,
        _errorHandler = errorHandler;

  @override
  Future<String?> build(Null params) async {
    final result = _beyondRepository.retrieveRoomId();
    return result;
  }

  @override
  ErrorHandler errorHandler() => _errorHandler;
}
