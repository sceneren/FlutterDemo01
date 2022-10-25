import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/home/widget/home_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'navigation_logic.dart';

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
    return SafeArea(
      top: true,
      child: HomeItem(),
    );
  }

  @override
  void dispose() {
    Get.delete<NavigationLogic>();
    super.dispose();
  }
}
