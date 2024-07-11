import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/core/error_handler.dart';
import '../../domain/repositories/beyond_repository_impl.dart';
import '../../domain/usecases/retrieve_room_id.dart';
import '../../domain/usecases/save_room_id.dart';

class BeyondFacade {
  static final _getIt = GetIt.instance;

  /// Dependencies
  static final _beyondRepository = BeyondRepositoryImpl(
    sharedPreferences: _getIt.get<SharedPreferences>(),
  );
  final retrieveRoomId = RetrieveRoomId(
    beyondRepository: _beyondRepository,
    errorHandler: _getIt.get<ErrorHandler>(),
  );

  final saveRoomId = SaveRoomId(
    beyondRepository: _beyondRepository,
    errorHandler: _getIt.get<ErrorHandler>(),
  );
}
