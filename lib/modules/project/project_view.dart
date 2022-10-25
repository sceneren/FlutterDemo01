import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/project/project_detail/project_detail_view.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/widget/base_root_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../res/strings.dart';
import '../../widget/custom_top_bar.dart';
import 'project_logic.dart';

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
    return GetBuilder<ProjectLogic>(builder: (logic) {
      var list = state.list;
      var tabs = <Tab>[];
      for (var i = 0; i < list.length; i++) {
        tabs.add(Tab(text: list[i].name ?? ""));
      }

      var tabViews = <Widget>[];
      for (var i = 0; i < list.length; i++) {
        tabViews.add(ProjectDetailPage(id: list[i].id));
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

  @override
  void dispose() {
    Get.delete<ProjectLogic>();
    super.dispose();
  }
}
