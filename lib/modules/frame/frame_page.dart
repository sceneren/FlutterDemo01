import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'frame_logic.dart';

/// 主框架
class FramePage extends StatelessWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Get.put(FrameLogic());
    return Material(
        child: Column(
      children: const [
        Text("FramePage"),
      ],
    ));
  }
}
