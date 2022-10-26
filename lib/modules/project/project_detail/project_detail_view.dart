import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/project/project_detail/project_detail_state.dart';
import 'package:flutter_demo/modules/project/widget/project_item.dart';
import 'package:get/get.dart';

import '../../../widget/refresh/custom_refresh.dart';
import '../../../widget/state_wrapper.dart';
import 'project_detail_logic.dart';

class ProjectDetailPage extends StatelessWidget {
  late int cid;

  ProjectDetailPage({super.key, required this.cid});

  @override
  Widget build(BuildContext context) {
    final ProjectDetailLogic logic =
        Get.put(ProjectDetailLogic(cid: cid), tag: cid.toString());
    final ProjectDetailState state =
        Get.find<ProjectDetailLogic>(tag: cid.toString()).state;
    return GetBuilder<ProjectDetailLogic>(
        tag: cid.toString(),
        builder: (logic) {
          return StateWrapper(
            state: logic.loadState,
            child: CustomRefresh<ProjectDetailLogic>(
                tag: cid.toString(),
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
            onRetry: () {
              logic.firstRequest();
            },
          );
        });
  }
}
