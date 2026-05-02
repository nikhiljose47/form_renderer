import 'package:form_renderer/models/form_page_model.dart';
import 'package:form_renderer/models/form_action_model.dart';
import 'package:form_renderer/core/services/form_state_store.dart';

class FormEngine {
  final List<FormPageModel> pages;
  final List<FormActionModel> actions;

  int currentIndex = 0;

  final _store = FormStateStore();

  FormEngine({required this.pages, required this.actions});

  FormPageModel get currentPage => pages[currentIndex];

  int get total => pages.length;

  bool get canGoBack => currentIndex > 0;

  String? onNextAction() {
    final error = _validateCurrentPage();
    if (error != null) {
      return 'ERROR: $error';
    }

    final label = currentPage.actionLabel;

    if (label == 'NEXT' && currentIndex < pages.length - 1) {
      currentIndex++;
    }

    if (label == 'SUBMIT') {
      for (var a in actions) {
        if (a.type == 'NAVIGATION') {
          return a.properties['name'];
        }
      }
    }

    return null;
  }

  String? _validateCurrentPage() {
    final fields = currentPage.properties;

    for (var field in fields) {
      final key = field.fieldName;
      final value = _store.getValue(key);

      if (field.mandatory == true) {
        if (value == null || value.toString().trim().isEmpty) {
          return field.label;
        }
      }

      for (var rule in field.validations ?? []) {
        if (rule.type == 'minLength') {
          final min = rule.value ?? 0;
          if ((value ?? '').length < min) {
            return rule.message ?? "Minimum $min characters required";
          }
        }
      }
    }

    return null;
  }

  void onBack() {
    if (currentIndex > 0) {
      currentIndex--;
    }
  }
}
