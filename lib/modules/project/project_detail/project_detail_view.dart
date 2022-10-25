import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'project_detail_logic.dart';

class ProjectDetailPage extends StatelessWidget {
  final logic = Get.put(ProjectDetailLogic());
  final state = Get.find<ProjectDetailLogic>().state;

  int? id;

  ProjectDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text("id = $id"),
    );
  }
}
