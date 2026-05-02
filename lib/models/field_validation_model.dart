class FieldValidationModel {
  final String type;
  final dynamic value;
  final String message;

  FieldValidationModel({required this.type, this.value, required this.message});

  factory FieldValidationModel.fromJson(Map<String, dynamic> json) {
    return FieldValidationModel(
      type: json['type'] ?? '',
      value: json['value'],
      message: json['message'] ?? '',
    );
  }
}
