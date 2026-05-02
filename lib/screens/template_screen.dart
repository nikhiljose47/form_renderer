import 'package:flutter/material.dart';
import 'package:form_renderer/core/utils/form_value_replacer.dart';
import 'package:form_renderer/models/form_flow_model.dart';

class TemplateScreen extends StatelessWidget {
  final FormFlowModel flow;
  final Function(String) onNavigate;

  const TemplateScreen({
    super.key,
    required this.flow,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final sections = flow.templateSections ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(flow.heading)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (var section in sections)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      for (var item in section.items)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.label),
                            Text(FormValueReplacer.replace(item.value)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => onNavigate("stockForm"),
              child: const Text("Back to form"),
            ),
          ],
        ),
      ),
    );
  }
}
