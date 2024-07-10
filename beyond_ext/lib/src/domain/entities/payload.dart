class Payload {
  final String roomId;
  final String? roomName;
  final int? maxClient;
  final bool? warnClient;
  final String? deviceName;
  final String? brand;
  final String? os;
  final int? id;
  final int? createdAt;
  final String? baseUrl;
  final String? path;
  final String? params;
  final String? method;
  final String? requestHeader;
  final String? requestBody;
  final int? requestSize;
  final int? requestHashCode;

  Payload({
    required this.roomId,
    this.roomName,
    this.maxClient,
    this.warnClient,
    this.deviceName,
    this.brand,
    this.os,
    this.id,
    this.createdAt,
    this.baseUrl,
    this.path,
    this.params,
    this.method,
    this.requestHeader,
    this.requestBody,
    this.requestSize,
    this.requestHashCode,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      roomId: json['roomId'],
      roomName: json['roomName'],
      maxClient: json['maxClient'],
      warnClient: json['warnClient'],
      deviceName: json['deviceName'],
      brand: json['brand'],
      os: json['os'],
      id: json['id'],
      createdAt: json['createdAt'],
      baseUrl: json['baseUrl'],
      path: json['path'],
      params: json['params'],
      method: json['method'],
      requestHeader: json['requestHeader'],
      requestBody: json['requestBody'],
      requestSize: json['requestSize'],
      requestHashCode: json['requestHashCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['roomName'] = roomName;
    data['maxClient'] = maxClient;
    data['warnClient'] = warnClient;
    data['deviceName'] = deviceName;
    data['brand'] = brand;
    data['os'] = os;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['baseUrl'] = baseUrl;
    data['path'] = path;
    data['params'] = params;
    data['method'] = method;
    data['requestHeader'] = requestHeader;
    data['requestBody'] = requestBody;
    data['requestSize'] = requestSize;
    data['requestHashCode'] = requestHashCode;
    return data;
  }
}
