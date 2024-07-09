class Metadata {
  final String clientType;
  final String actionType;

  Metadata({
    required this.clientType,
    required this.actionType,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        clientType: json['clientType'],
        actionType: json['actionType'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['clientType'] = clientType;
    json['actionType'] = actionType;
    return json;
  }
}
