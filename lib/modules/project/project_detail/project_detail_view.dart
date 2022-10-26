import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/project/widget/project_item.dart';
import 'package:get/get.dart';

import '../../../widget/refresh/custom_refresh.dart';
import '../../../widget/state_wrapper.dart';
import 'project_detail_logic.dart';

class ProjectDetailPage extends StatefulWidget {
  int cid;

  ProjectDetailPage({super.key, required this.cid});

  @override
  State<StatefulWidget> createState() => _ProjectDetailPageState(cid);
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final logic = Get.put(ProjectDetailLogic());
  final state = Get.find<ProjectDetailLogic>().state;

  _ProjectDetailPageState(int cid) {
    state.cid = cid;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectDetailLogic>(
      assignId: true,
      builder: (logic1) {
        return StateWrapper(
          state: logic.loadState,
          child: CustomRefresh<ProjectDetailLogic>(
              child: ListView.separated(
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              return ProjectItem(
                projectMo: state.list[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const SizedBox();
              }
              return const Divider(
                height: 1,
                color: Colors.green,
              );
            },
          )),
        );
      },
    );
  }
}
