import 'package:demo01/common/routes/app_routes.dart';
import 'package:demo01/res/colors.dart';
import 'package:demo01/widget/click_text.dart';
import 'package:demo01/widget/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'frame_logic.dart';

/// 主框架
class FramePage extends StatelessWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Get.put(FrameLogic());
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Material(
          color: ColorRes.colorBackground,
          child: Column(
            children: [
              _buildTopBar(),
              _buildBody(),
            ],
          )
      ),
    );
  }

  ///头部
  Widget _buildTopBar() {
    return CustomTitleBar(
      title: "主页",
    );
  }

  ///body
  Widget _buildBody() {
    return Column(children: [
      ClickText(
          text: "登录",
          textColor: Colors.black,
          onClick: () {
            AppRoutes.toLogin();
          }),
      ClickText(
          text: "列表",
          textColor: Colors.black,
          onClick: () {
            Get.toNamed(AppRoutes.list);
          }),
      ClickText(
          text: "GetX测试",
          textColor: Colors.black,
          onClick: () {
            Get.toNamed(AppRoutes.test);
          }),
    ]);
  }
}
