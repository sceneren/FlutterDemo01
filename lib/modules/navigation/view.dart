import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final logic = Get.put(NavigationLogic());
  final state = Get.find<NavigationLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
      child: const Text("我是导航组件"),
    );
  }

  @override
  void dispose() {
    Get.delete<NavigationLogic>();
    super.dispose();
  }
}
