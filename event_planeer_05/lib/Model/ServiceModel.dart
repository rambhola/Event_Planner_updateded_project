class ServiceModel {
  int? id;
  String? service_name;
  String? service_desc;
  DateTime? createdAt;
  DateTime? updatedAt;

  ServiceModel({
    required this.id,
    required this.service_name,
    required this.service_desc,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor for parsing JSON
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      service_name: json['service_name'],
      service_desc: json['service_desc'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }
}
