import 'package:shared_preferences/shared_preferences.dart';

import 'beyond_repository.dart';

class BeyondRepositoryImpl implements BeyondRepository {
  final SharedPreferences _sharedPreferences;

  BeyondRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<String?> retrieveRoomId() {
    return Future.value(
      _sharedPreferences.getString('roomId'),
    );
  }

  @override
  Future<bool> saveRoomId(String roomId) {
    return _sharedPreferences.setString('roomId', roomId);
  }
}
