import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final logic = Get.put(ProjectLogic());
  final state = Get.find<ProjectLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
      child: const Text("我是项目组件"),
    );
  }

  @override
  void dispose() {
    Get.delete<ProjectLogic>();
    super.dispose();
  }
}
