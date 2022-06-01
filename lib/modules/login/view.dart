import 'package:demo01/common/routes/app_routes.dart';
import 'package:demo01/common/utils/log_utils.dart';
import 'package:demo01/common/utils/repeat_click.dart';
import 'package:demo01/res/colors.dart';
import 'package:demo01/res/res.dart';
import 'package:demo01/res/strings.dart';
import 'package:demo01/widget/base_root_view.dart';
import 'package:demo01/widget/click_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widget/custom_text_field.dart';
import '../../widget/radius_solid_button.dart';
import '../../widget/radius_stroke_button.dart';
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
    return BaseRootView(
      child: WillPopScope(
          child: Container(
            color: ColorRes.colorBackground,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    Res.bgLoginBottom,
                    width: 750.w,
                    height: 577.w,
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 80.w),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 531.w,
                          height: 88.w,
                          margin: EdgeInsets.fromLTRB(0, 171.w, 0, 0),
                          child: Image.asset(Res.icLoginHead),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 50.w, 0, 20.w),
                          alignment: Alignment.centerLeft,
                          child: ClickText(
                            text: StringRes.account,
                            textSize: 28.sp,
                            textColor: ColorRes.color_A8A8A8,
                          ),
                        ),
                        CustomTextField(
                          hint: StringRes.pleaseEnterEmailAddress,
                          hintColor: ColorRes.color_707070,
                          textColor: Colors.white,
                          inputType: TextInputType.emailAddress,
                          background: ColorRes.color_130F25,
                          maxLines: 1,
                          radius: 10.w,
                          paddingTop: 30.w,
                          paddingLeft: 16.w,
                          paddingRight: 16.w,
                          paddingBottom: 30.w,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 36.w, 0, 20.w),
                          alignment: Alignment.centerLeft,
                          child: ClickText(
                            text: StringRes.password,
                            textSize: 28.sp,
                            textColor: ColorRes.color_A8A8A8,
                          ),
                        ),
                        CustomTextField(
                          hint: StringRes.pleaseEnterLoginPassword,
                          hintColor: ColorRes.color_707070,
                          textColor: Colors.white,
                          inputType: TextInputType.visiblePassword,
                          background: ColorRes.color_130F25,
                          maxLines: 1,
                          radius: 10.w,
                          paddingTop: 30.w,
                          paddingLeft: 16.w,
                          paddingRight: 16.w,
                          paddingBottom: 30.w,
                          obscureText: true,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.fromLTRB(0, 20.w, 0, 0),
                          child: ClickText(
                            textSize: 26.w,
                            textColor: ColorRes.color_01F5AE,
                            text: StringRes.forgetPassword,
                            onClick: () {
                              logger.e("点击忘记密码");
                            },
                          ),
                        ),
                        RadiusSolidButton(
                          marginTop: 50.w,
                          backgroundColor: ColorRes.color_09B495,
                          radius: 10.w,
                          text: StringRes.login,
                          onClick: () {
                            logger.e("点击登录===>${DateTime.now()}");
                          },
                        ),
                        RadiusStrokeButton(
                          marginTop: 24.w,
                          radius: 10.w,
                          text: StringRes.register,
                          onClick: (){
                            logger.e("点击注册");
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
          onWillPop: () async {
            AppRoutes.toMain();
            return false;
          }),
    );
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }
}
