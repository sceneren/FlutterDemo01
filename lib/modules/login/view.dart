import 'package:demo01/common/routes/app_routes.dart';
import 'package:demo01/res/colors.dart';
import 'package:demo01/res/res.dart';
import 'package:demo01/res/strings.dart';
import 'package:demo01/widget/click_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          color: ColorRes.colorBackground,
          padding: EdgeInsets.symmetric(horizontal: 80.w),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 531.w,
                height: 88.w,
                margin: EdgeInsets.fromLTRB(0, 136.w, 0, 0),
                child: Image.asset(Res.icLoginHead),
              ),
              ClickText(
                text: StringRes.account,
                textSize: 28.sp,
                textColor: ColorRes.color_A8A8A8,
              ),
            ],
          ),
        ),
        onWillPop: () async {
          AppRoutes.toMain();
          return false;
        });
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }
}
