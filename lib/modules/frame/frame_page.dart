import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo01/widget/custom_top_bar.dart';
import 'package:demo01/common/routes/app_routes.dart';

import 'frame_logic.dart';

/// 主框架
class FramePage extends StatelessWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Get.put(FrameLogic());
    return Material(
        child: Column(
      children: [
        _buildTopBar(),
        _buildBody(),
      ],
    ));
  }

  ///头部
  Widget _buildTopBar() {
    return CustomTopBar(
      title: "主页",
    );
  }

  ///body
  Widget _buildBody() {
    return Column(children: [
      GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.list);
        },
        child: Container(
          width: double.infinity,
          height: 50.w,
          color: Colors.grey,
          child: Text("列表"),
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.test);
        },
        child: Container(
          width: double.infinity,
          height: 50.w,
          color: Colors.grey,
          child: Text("GetX测试"),
        ),
      ),
    ]);
  }
}
