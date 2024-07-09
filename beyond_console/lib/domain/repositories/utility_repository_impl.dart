import 'package:beyond_console/domain/repositories/utility_repository.dart';
import 'package:dio/dio.dart';

import '../../common/utils/network_util.dart';

class UtilityRepositoryImpl implements UtilityRepository {
  final Dio _dioClient;

  UtilityRepositoryImpl({
    required Dio dioClient,
  }) : _dioClient = dioClient;

  @override
  Future<String?> retrieveIpAddress() async {
    const url = 'https://api.ipify.org?format=json';
    final response = await _dioClient.get(url);
    final result = response.data;
    return result['ip'];
  }

  @override
  Future<List<String>>? retrieveSocketServers({
    required String ipAddress,
    required int socketPort,
  }) async {
    List<String>? servers = [];
    final subnet = NetworkUtil.removeIpLastSection(ipAddress);

    for (int i = 1; i <= 254; i++) {
      final searchAddress = '$subnet.$i:$socketPort';
      final response = await _dioClient.get(searchAddress);
      if (response.statusCode == 200) {
        servers.add(searchAddress);
      }
    }
    print(servers.toString());
    return servers;
  }
}
