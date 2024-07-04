import 'package:beyond_console/domain/repositories/utility_repository.dart';
import 'package:dio/dio.dart';

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
}
