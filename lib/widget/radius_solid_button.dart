import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/repeat_click.dart';

class RadiusSolidButton extends StatelessWidget {
  VoidCallback? onClick;
  String? text;
  Color? textColor;
  Color? backgroundColor;
  double? radius;
  double marginLeft;
  double marginTop;
  double marginRight;
  double marginBottom;
  double fontSize;
  FontWeight? fontWeight;

  RadiusSolidButton({
    Key? key,
    this.onClick,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.radius,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
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
              borderRadius: radius != null
                  ? BorderRadius.all(Radius.circular(radius!))
                  : BorderRadius.zero),
          fillColor: backgroundColor,
          textStyle: TextStyle(fontSize: 28.w),
          padding: EdgeInsets.symmetric(vertical: 26.w),
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Text(
            text ?? "",
            style: TextStyle(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
          ),
        ));
  }
}
