class FormActionModel {
  final String type;
  final Map<String, dynamic> properties;

  FormActionModel({
    required this.type,
    required this.properties,
  });

  factory FormActionModel.fromJson(Map<String, dynamic> json) {
    return FormActionModel(
      type: json['actionType'] ?? '',
      properties: json['properties'] ?? {},
    );
  }
}