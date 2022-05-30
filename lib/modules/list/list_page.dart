import 'package:demo01/widget/custom_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo01/widget/custom_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'list_logic.dart';

class ListPage extends StatelessWidget implements CustomStatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Get.put(ListLogic());
    return Material(
        child: Column(
      children: [
        buildTitleBar(),
        buildBody()
        //_buildTopBar(),
        //_buildBody(),
      ],
    ));
  }

  @override
  Widget buildTitleBar() {
    return CustomTopBar(
      title: "列表",
    );
  }

  @override
  Widget buildBody() {
    return GestureDetector(
      child: Text("测试"),
      onTap: () {
        Get.defaultDialog(
          title: "测试",
          radius: 10.w,
          content: Text("内容"),
          confirmTextColor: Colors.red,
          textConfirm: "确定",
          cancelTextColor: Colors.blue,
          textCancel: "取消",
          onConfirm: () {
            print("确定");
            Get.back();
          },
          onCancel: () {
            print("取消");
            Get.back();
          },
        );
      },
    );
  }
}
