import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/strings.dart';

class CustomTextField extends StatelessWidget {
  String text;
  double? textSize;
  Color? textColor;
  Color? hintColor;
  String? hint;
  double paddingLeft;
  double paddingTop;
  double paddingRight;
  double paddingBottom;
  int maxLines;
  TextInputType? inputType;
  Color? background;
  Color? borderColor;
  double? borderWidth;
  double? radius;
  bool obscureText;

  CustomTextField(
      {Key? key,
      this.text = "",
      this.textColor,
      this.textSize,
      this.maxLines = 1,
      this.hint,
      this.hintColor,
      this.inputType,
      this.background,
      this.borderColor,
      this.borderWidth,
      this.radius = 0,
      this.obscureText = false,
      this.paddingLeft = 0,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.paddingRight = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxBorder? boxBorder;
    if (borderColor != null) {
      boxBorder = Border.all(color: borderColor!, width: borderWidth ?? 1.w);
    } else {
      boxBorder = null;
    }

    return CupertinoTextField(
      decoration: BoxDecoration(
        color: background,
        borderRadius: radius != null
            ? BorderRadius.all(Radius.circular(radius!))
            : BorderRadius.zero,
        border: boxBorder,
      ),
      keyboardType: inputType,
      obscureText: true,
      placeholder: StringRes.pleaseEnterEmailAddress,
      placeholderStyle: TextStyle(color: hintColor, fontSize: textSize),
      showCursor: true,
      padding: EdgeInsets.fromLTRB(
          paddingLeft, paddingTop, paddingRight, paddingBottom),
      style: TextStyle(color: textColor, fontSize: textSize),
      maxLines: 1,
    );
  }
}
