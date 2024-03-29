import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_top_bar.dart';
import 'logic.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final logic = Get.put(TestLogic());
  final state = Get.find<TestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          CustomTitleBar(
            title: "测试",
            isShowBack: true,
          ),
          GetBuilder<TestLogic>(
            builder: (logic) {
              return Text(
                '点击了 ${state.count} 次',
                style: TextStyle(fontSize: 30.w),
              );
            },
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TestLogic>();
    super.dispose();
  }
}
