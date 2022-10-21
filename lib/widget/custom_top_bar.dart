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

  const CustomTitleBar(
      {Key? key,
      this.title = "",
      this.isShowBack = false,
      this.rightChild,
      this.color = ColorRes.colorTitleBarBg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _statusBarInit();
    //获取距离顶部的高度,可以空出水滴,刘海的位置
    var top = MediaQuery.of(context).padding.top;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: top + 97.w,
      padding: EdgeInsets.only(top: top),
      decoration: BoxDecoration(color: color),
      child: Stack(
        children: [
          if (isShowBack)
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 97.w,
                height: 97.w,
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 34.w,
                ),
              ),
            ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 97.w),
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
