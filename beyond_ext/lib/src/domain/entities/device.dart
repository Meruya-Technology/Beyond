class Device {
  final String name;
  final String? os;
  final String? brand;

  Device({
    required this.name,
    this.os,
    this.brand,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      name: json['name'],
      os: json['os'],
      brand: json['brand'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['os'] = os;
    data['brand'] = brand;
    return data;
  }
}
