import 'package:flutter/material.dart';
import 'package:form_renderer/models/form_field_model.dart';
import 'package:form_renderer/models/form_page_model.dart';

import 'package:form_renderer/widgets/fields/dropdown_fields.dart';
import 'package:form_renderer/widgets/fields/text_input_field.dart';

class FormPageBody extends StatelessWidget {
  final FormPageModel page;

  const FormPageBody({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final fields = page.properties;

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: fields.length,
      itemBuilder: (context, index) {
        final field = fields[index];
        return _buildField(field);
      },
    );
  }

  Widget _buildField(FormFieldModel field) {
    switch (field.format) {
      case 'textInput':
        return TextInputField(field: field);

      case 'dropdown':
        return DropdownField(field: field);

      default:
        return const SizedBox.shrink();
    }
  }
}
