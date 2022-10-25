import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../res/colors.dart';

/// 沉浸式状态栏
class CustomTitleBar extends StatelessWidget {
  final String title;
  final bool isShowBack;
  final Color color;
  final Widget? rightChild;
  final bool showTitleBar;

  const CustomTitleBar(
      {Key? key,
      this.title = "",
      this.isShowBack = false,
      this.rightChild,
      this.showTitleBar = true,
      this.color = ColorRes.colorTitleBarBg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _statusBarInit();
    //获取距离顶部的高度,可以空出水滴,刘海的位置
    var statusBarHeight = ScreenUtil().statusBarHeight;
    if (Platform.isIOS) {
      statusBarHeight = statusBarHeight - 15;
    }

    var titleBarHeight = 97.w;

    double totalHeight;
    if (showTitleBar) {
      totalHeight = statusBarHeight +titleBarHeight;
    } else {
      totalHeight = statusBarHeight;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: totalHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(color: color),
      child: Stack(
        children: [
          if (isShowBack)
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: titleBarHeight,
                height: titleBarHeight,
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 34.w,
                ),
              ),
            ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: titleBarHeight),
            child: Center(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (rightChild != null) rightChild!,
        ],
      ),
    );
  }

  void _statusBarInit() {
    // changeStatusBar(color: color, statusStyle: statusStyle);
  }
}
