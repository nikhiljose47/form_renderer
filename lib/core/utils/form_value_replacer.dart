import 'package:form_renderer/core/services/form_state_store.dart';

class FormValueReplacer {
  static String resolve(String text) {
    final data = FormStateStore().getAll();

    data.forEach((key, value) {
      text = text.replaceAll('{{$key}}', value?.toString() ?? '');
    });

    return text;
  }
}
