import 'package:form_renderer/models/field_validation_model.dart';

class FormFieldModel {
  final String type;
  final String format;
  final String fieldName;
  final String label;
  final bool mandatory;
  final List<Map<String, dynamic>>? options; // enums
  final List<FieldValidationModel>? validations;

  FormFieldModel({
    required this.type,
    required this.format,
    required this.fieldName,
    required this.label,
    required this.mandatory,
    this.options,
    this.validations,
  });

  factory FormFieldModel.fromJson(Map<String, dynamic> json) {
    return FormFieldModel(
      type: json['type'] ?? '',
      format: json['format'] ?? '',
      fieldName: json['fieldName'] ?? '',
      label: json['label'] ?? '',
      mandatory: json['mandatory'] ?? false,
      options: json['enums'] != null
          ? List<Map<String, dynamic>>.from(json['enums'])
          : null,
      validations: json['validations'] != null
          ? (json['validations'] as List)
              .map((e) => FieldValidationModel.fromJson(e))
              .toList()
          : null,
    );
  }
}