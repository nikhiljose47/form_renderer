import 'package:flutter/material.dart';
import 'package:form_renderer/core/services/form_state_store.dart';
import 'package:form_renderer/models/form_field_model.dart';

class DropdownField extends StatefulWidget {
  final FormFieldModel field;

  const DropdownField({
    super.key,
    required this.field,
  });

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  final store = FormStateStore();

  @override
  Widget build(BuildContext context) {
    final field = widget.field;
    final key = field.fieldName;
    final options = field.options ?? [];

    final value = store.getValue<String>(key);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: field.label,
          border: const OutlineInputBorder(),
        ),
        items: options.map<DropdownMenuItem<String>>((e) {
          return DropdownMenuItem<String>(
            value: e['code'],
            child: Text(e['name']),
          );
        }).toList(),
        onChanged: (val) {
          store.setValue(key, val);
          setState(() {});
        },
      ),
    );
  }
}