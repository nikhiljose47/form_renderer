import 'package:flutter/material.dart';
import 'package:form_renderer/core/services/form_engine.dart';
import 'package:form_renderer/models/form_flow_model.dart';
import 'package:form_renderer/screens/form_screen.dart';
import 'package:form_renderer/screens/template_screen.dart';

class FlowManager extends StatefulWidget {
  final List<FormFlowModel> flows;
  final String initialFlow;

  const FlowManager({
    super.key,
    required this.flows,
    required this.initialFlow,
  });

  @override
  State<FlowManager> createState() => _FlowManagerState();
}

class _FlowManagerState extends State<FlowManager> {
  late FormFlowModel currentFlow;
  FormEngine? engine;

  @override
  void initState() {
    super.initState();
    currentFlow = _getFlow(widget.initialFlow);
    _initEngine();
  }

  FormFlowModel _getFlow(String name) {
    for (var f in widget.flows) {
      if (f.name == name) return f;
    }
    return FormFlowModel(
      name: '',
      heading: '',
      screenType: '',
      pages: [],
      onSubmit: [],
    );
  }

  void _initEngine() {
    engine = FormEngine(
      pages: currentFlow.pages,
      actions: currentFlow.onSubmit,
    );
  }

  void handleNext() {
    final result = engine!.onNextAction();

    if (result != null && result.startsWith("ERROR:")) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
      return;
    }

    if (result != null) {
      setState(() {
        currentFlow = _getFlow(result);
        _initEngine();
      });
      return;
    }

    setState(() {});
  }

  void handleBack() {
    setState(() {
      engine!.onBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentFlow.screenType == 'TEMPLATE') {
      return TemplateScreen(
        flow: currentFlow,
        onNavigate: (name) {
          setState(() {
            currentFlow = _getFlow(name);
            _initEngine();
          });
        },
      );
    }

    return FormScreen(
      flow: currentFlow,
      page: engine!.currentPage,
      currentIndex: engine!.currentIndex,
      total: engine!.total,
      onNext: handleNext,
      onBack: handleBack,
    );
  }
}
