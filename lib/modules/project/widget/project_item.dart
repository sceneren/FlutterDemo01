import 'package:flutter/material.dart';
import 'package:flutter_demo/data/models/project_mo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectItem extends StatelessWidget {
  final ProjectMo projectMo;

  const ProjectItem({super.key, required this.projectMo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.w),
      color: Colors.red,
      child: Text("id = ${projectMo.title}"),
    );
  }
}
