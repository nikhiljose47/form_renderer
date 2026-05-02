import 'package:form_renderer/models/form_page_model.dart';
import 'form_action_model.dart';
import 'template_section_model.dart';

class FormFlowModel {
  final String name;
  final String heading;
  final String screenType;

  final List<FormPageModel> pages;
  final List<FormActionModel> onSubmit;

  final List<TemplateSectionModel>? templateSections;

  FormFlowModel({
    required this.name,
    required this.heading,
    required this.screenType,
    required this.pages,
    required this.onSubmit,
    this.templateSections,
  });

  factory FormFlowModel.fromJson(Map<String, dynamic> json) {

    List<FormPageModel> pagesList = [];
    if (json['pages'] != null) {
      List rawPages = json['pages'];
      for (var p in rawPages) {
        pagesList.add(FormPageModel.fromJson(p));
      }
    }

    List<FormActionModel> actionsList = [];
    if (json['onSubmit'] != null) {
      List rawActions = json['onSubmit'];
      for (var a in rawActions) {
        actionsList.add(FormActionModel.fromJson(a));
      }
    }

    List<TemplateSectionModel>? sections;

    if (json['body'] != null) {
      sections = [];
      List rawBody = json['body'];

      for (var item in rawBody) {
        sections.add(TemplateSectionModel.fromJson(item));
      }
    }

    return FormFlowModel(
      name: json['name'] ?? '',
      heading: json['heading'] ?? '',
      screenType: json['screenType'] ?? 'FORM',
      pages: pagesList,
      onSubmit: actionsList,
      templateSections: sections,
    );
  }
}