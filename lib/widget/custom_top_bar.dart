import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 沉浸式状态栏
class CustomTopBar extends StatelessWidget {
  final String title;
  final bool isShowBack;
  final Color color;
  final double height; // 实际app 状态栏的高度
  // final Widget? rightChild;

  const CustomTopBar(
      {Key? key,
      this.title = "",
      this.isShowBack = false,
      this.color = Colors.white,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _statusBarInit();
    //获取距离顶部的高度,可以空出水滴,刘海的位置
    var top = MediaQuery.of(context).padding.top;
    return Container(
      child: Row(
        children: [
          if (isShowBack)
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 50.w,
                height: 50.w,
                child: Image.asset(
                  'assets/images/back.png',
                  width: 20.w,
                  height: 20.w,
                ),
              ),
            ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          //if (rightChild != null) rightChild,
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: top + height,
      padding: EdgeInsets.only(top: top),
      decoration: BoxDecoration(color: color),
    );
  }

  void _statusBarInit() {
    //changeStatusBar(color: color, statusStyle: statusStyle);
  }
}
