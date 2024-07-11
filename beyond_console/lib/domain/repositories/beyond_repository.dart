// import '../entities/device.dart';

abstract class BeyondRepository {
  Future<bool> saveRoomId(String roomId);

  Future<String?> retrieveRoomId();
}
