import 'package:demo01/common/routes/app_routes.dart';
import 'package:demo01/widget/base_root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/utils/log_utils.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../widget/custom_top_bar.dart';
import '../../widget/radius_solid_button.dart';
import '../../widget/radius_stroke_button.dart';
import 'logic.dart';

class FramePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(FrameLogic());
    final state = Get.find<FrameLogic>().state;

    return BaseRootView(
      child: Material(
          color: ColorRes.colorBackground,
          child: Column(
            children: [_buildTitleBar(), _buildBody()],
          )),
    );
  }

  ///头部
  Widget _buildTitleBar() {
    return CustomTitleBar(
      title: "主页",
    );
  }

  ///body
  Widget _buildBody() {
    return Column(
      children: [
        RadiusSolidButton(
          marginTop: 50.w,
          marginLeft: 50.w,
          marginRight: 50.w,
          backgroundColor: ColorRes.color_09B495,
          radius: 10.w,
          text: StringRes.login,
          onClick: () {
            AppRoutes.toLogin();
          },
        ),
        RadiusSolidButton(
          marginTop: 24.w,
          marginLeft: 50.w,
          marginRight: 50.w,
          backgroundColor: ColorRes.color_09B495,
          radius: 10.w,
          text: "列表",
          onClick: () {
            Get.toNamed(AppRoutes.list);
          },
        ),
        RadiusSolidButton(
          marginTop: 24.w,
          marginLeft: 50.w,
          marginRight: 50.w,
          backgroundColor: ColorRes.color_09B495,
          radius: 10.w,
          text: "测试",
          onClick: () {
            Get.toNamed(AppRoutes.test);
          },
        )
      ],
    );
  }
}
