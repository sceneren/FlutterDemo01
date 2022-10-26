import 'package:flutter/material.dart';
import 'package:flutter_demo/common/utils/log_utils.dart';
import 'package:flutter_demo/modules/project/project_detail/project_detail_view.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/widget/base_root_view.dart';
import 'package:flutter_demo/widget/keep_alive_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../res/strings.dart';
import '../../widget/custom_top_bar.dart';
import 'project_logic.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ProjectLogic());
    final state = Get.find<ProjectLogic>().state;

    return GetBuilder<ProjectLogic>(builder: (logic) {
      var list = state.list;
      var tabs = <Tab>[];
      for (var i = 0; i < list.length; i++) {
        tabs.add(Tab(text: list[i].name ?? ""));
      }

      var tabViews = <Widget>[];
      for (var i = 0; i < list.length; i++) {
        tabViews.add(KeepAliveWrapper(child: ProjectDetailPage(cid: list[i].id ?? 0)));
      }
      return DefaultTabController(
          length: list.length,
          child: BaseRootView(
              child: Column(
            children: [
              const CustomTitleBar(
                title: StringRes.project,
                showTitleBar: false,
                isShowBack: false,
              ),
              Container(
                color: ColorRes.colorTitleBarBg,
                child: TabBar(
                  tabs: tabs,
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3.h,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: tabViews,
                ),
              )
            ],
          )));
    });
  }

}
