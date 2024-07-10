import '../entities/device.dart';

abstract class BeyondRepository {
  Future<bool> syncDevices(Device device);

  Future<bool> removeDevice(String name);

  Future<List<Device>?> retrieveDevices();
}
