abstract class UtilityRepository {
  Future<String?> retrieveIpAddress();

  Future<List<String>>? retrieveSocketServers({
    required String ipAddress,
    required int socketPort,
  });
}
