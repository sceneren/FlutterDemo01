import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final logic = Get.put(QuestionLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
      child: const Text("我是问答组件"),
    );
  }

  @override
  void dispose() {
    Get.delete<QuestionLogic>();
    super.dispose();
  }
}
