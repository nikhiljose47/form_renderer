import 'package:flutter/material.dart';
import 'package:form_renderer/models/form_flow_model.dart';
import 'package:form_renderer/models/form_page_model.dart';
import 'package:form_renderer/widgets/form_header.dart';
import 'package:form_renderer/widgets/form_page_body.dart';

class FormScreen extends StatelessWidget {
  final FormFlowModel flow;
  final FormPageModel page;

  final int currentIndex;
  final int total;

  final VoidCallback onNext;
  final VoidCallback onBack;

  const FormScreen({
    super.key,
    required this.flow,
    required this.page,
    required this.currentIndex,
    required this.total,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(flow.heading)),
      body: Column(
        children: [
          FormHeader(
            title: page.title,
            currentIndex: currentIndex,
            total: total,
          ),

          Expanded(
            child: FormPageBody(page: page),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                if (currentIndex > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onBack,
                      child: const Text("Back"),
                    ),
                  ),

                if (currentIndex > 0) const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: onNext,
                    child: Text(page.actionLabel),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}