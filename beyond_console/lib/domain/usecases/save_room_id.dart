import '../../common/core/error_handler.dart';
import '../../common/core/usecase.dart';
import '../repositories/beyond_repository.dart';

class SaveRoomId extends UseCase<bool, String> {
  final BeyondRepository _beyondRepository;
  final ErrorHandler _errorHandler;

  SaveRoomId({
    required BeyondRepository beyondRepository,
    required ErrorHandler errorHandler,
  })  : _beyondRepository = beyondRepository,
        _errorHandler = errorHandler;

  @override
  Future<bool> build(String params) async {
    final result = _beyondRepository.saveRoomId(params);
    return result;
  }

  @override
  ErrorHandler errorHandler() => _errorHandler;
}
