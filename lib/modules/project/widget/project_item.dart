import 'package:flutter/material.dart';
import 'package:flutter_demo/data/models/project_mo.dart';

class ProjectItem extends StatelessWidget {
  final ProjectMo projectMo;

  const ProjectItem({super.key, required this.projectMo});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text("id = ${projectMo.title}"),
    );
  }
}
