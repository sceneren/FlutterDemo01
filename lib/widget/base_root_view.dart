import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseRootView extends StatelessWidget {
  Widget? child;

  BaseRootView({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              //点击空白关闭软键盘
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: child //此处输入框
            ));
  }
}
