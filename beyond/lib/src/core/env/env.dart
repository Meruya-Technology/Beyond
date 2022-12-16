import 'dart:io';

class Env {
  final int port;
  final InternetAddress ip;
  final String dbService;
  final String dbHost;
  final int dbPort;
  final String dbName;
  final String dbUsername;
  final String? dbPassword;
  final String secretKey;

  Env({
    required this.port,
    required this.ip,
    required this.dbService,
    required this.dbHost,
    required this.dbPort,
    required this.dbName,
    required this.dbUsername,
    this.dbPassword,
    required this.secretKey,
  });

  factory Env.fromJson(Map<dynamic, dynamic> json) => Env(
        port: int.tryParse(json['PORT']) ?? 8080,
        ip: (json['IP'] != null)
            ? InternetAddress(json['IP'])
            : InternetAddress.anyIPv4,
        dbService: json['DB_SERVICE'] ?? 'postgres',
        dbHost: json['DB_HOST'] ?? 'localhost',
        dbPort: int.tryParse(json['DB_PORT']) ?? 5432,
        dbName: json['DB_NAME'] ?? 'database',
        dbUsername: json['DB_USERNAME'] ?? 'root',
        dbPassword: json['DB_PASSWORD'],
        secretKey: json['SECRET_KEY'],
      );
}
