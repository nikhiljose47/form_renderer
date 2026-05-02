import 'form_field_model.dart';

class FormPageModel {
  final String page;
  final String title;
  final String actionLabel;
  final List<FormFieldModel> properties;

  FormPageModel({
    required this.page,
    required this.title,
    required this.actionLabel,
    required this.properties,
  });

  factory FormPageModel.fromJson(Map<String, dynamic> json) {
    List<FormFieldModel> fields = [];

    if (json['properties'] != null) {
      List raw = json['properties'];
      for (var f in raw) {
        fields.add(FormFieldModel.fromJson(f));
      }
    }

    return FormPageModel(
      page: json['page'] ?? '',
      title: json['label'] ?? '',
      actionLabel: json['actionLabel'] ?? 'NEXT',
      properties: fields,
    );
  }
}