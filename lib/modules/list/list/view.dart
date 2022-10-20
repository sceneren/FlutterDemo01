import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/custom_top_bar.dart';
import 'logic.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final logic = Get.put(const ListPage());
  final state = Get.find<ListPage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          CustomTitleBar(
            title: "列表",
            isShowBack: true,
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    Get.delete<ListLogic>();
    super.dispose();
  }
}
