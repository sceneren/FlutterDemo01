import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/repeat_click.dart';
import '../res/colors.dart';

class RadiusStrokeButton extends StatelessWidget {
  VoidCallback? onClick;
  String? text;
  Color? textColor;
  Color? backgroundColor;
  Color? borderColor;
  double? borderWidth;
  double? radius;
  double marginLeft;
  double marginTop;
  double marginRight;
  double marginBottom;

  RadiusStrokeButton({
    Key? key,
    this.onClick,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.borderWidth,
    this.borderColor,
    this.radius,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(
            marginLeft, marginTop, marginRight, marginBottom),
        child: RawMaterialButton(
          onPressed: () {
            RepeatClick.checkClick(onClick);
          },
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: borderColor ?? ColorRes.color_09B495,
                  width: borderWidth ?? 1.w),
              borderRadius: radius != null
                  ? BorderRadius.all(Radius.circular(radius!))
                  : BorderRadius.zero),
          fillColor: backgroundColor,
          textStyle: TextStyle(fontSize: 28.w),
          padding: EdgeInsets.symmetric(vertical: 26.w),
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Text(
            text ?? "",
          ),
        ));
  }
}
