import 'package:flutter/material.dart';
import 'package:form_renderer/core/services/form_state_store.dart';
import 'package:form_renderer/models/form_field_model.dart';

class TextInputField extends StatefulWidget {
  final FormFieldModel field;

  const TextInputField({
    super.key,
    required this.field,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late TextEditingController controller;
  final store = FormStateStore();

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(
      text: store.getValue<String>(widget.field.fieldName) ?? '',
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final field = widget.field;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: field.label,
          border: const OutlineInputBorder(),
        ),
        onChanged: (value) {
          store.setValue(field.fieldName, value);
        },
      ),
    );
  }
}