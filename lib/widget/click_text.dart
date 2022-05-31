import 'package:flutter/material.dart';

class ClickText extends StatelessWidget {
  String text;
  Color textColor;
  double textSize;
  VoidCallback? onClick;

  ClickText(
      {Key? key,
      this.text = "",
      this.textColor = Colors.white,
      this.textSize = 14,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: textSize),
      ),
    );
  }
}
