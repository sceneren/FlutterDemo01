import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      return Container(
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
            child: Text("我是首页组件--->${logic.count}"),
          ),
          onTap: () {
            logic.increment();
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
