import 'package:flutter/material.dart';
import 'package:form_renderer/core/constants/assets_path.dart';
import 'package:form_renderer/core/services/config_loader.dart';
import 'package:form_renderer/models/form_flow_model.dart';
import 'package:form_renderer/screens/flow_manger_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FormFlowModel> flows = [];
  String initialFlow = "";

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final config = await ConfigLoader.load(AssetPaths.formData);
    List rawFlows = config['flows'];

    // List<FormFlowModel> parsed = [];
    // for (var f in rawFlows) {
    //   parsed.add(FormFlowModel.fromJson(f));
    // }

    setState(() {
      flows = rawFlows.map((e) => FormFlowModel.fromJson(e)).toList();
      initialFlow = config['initialPage'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (flows.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return FlowManager(
      flows: flows,
      initialFlow: initialFlow,
    );
  }
}