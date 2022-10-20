import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final logic = Get.put(MineLogic());
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child:const Text("我是我的组件") ,
      ),
    );
    // return Container(
    //   margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
    //   child: const Text("我是我的组件"),
    // );
  }
  @override
  void dispose() {
    Get.delete<MineLogic>();
    super.dispose();
  }
}
