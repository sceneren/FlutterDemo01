import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/home/view.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:get/get.dart';

import '../../res/strings.dart';
import '../mine/view.dart';
import '../navigation/view.dart';
import '../project/view.dart';
import '../question/view.dart';
import 'logic.dart';

class FramePage extends StatefulWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  final logic = Get.put(FrameLogic());

  final state = Get.find<FrameLogic>().state;

  final List<Widget> _pageList = [
    const HomePage(),
    const NavigationPage(),
    const QuestionPage(),
    const ProjectPage(),
    const MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FrameLogic>(builder: (logic) {
      return Scaffold(
        body: IndexedStack(
          index: logic.state.currentIndex,
          children: _pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: StringRes.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.navigation),
              label: StringRes.navigation,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer),
              label: StringRes.question,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: StringRes.project,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: StringRes.mine,
            ),
          ],
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.currentIndex,
          fixedColor: ColorRes.colorTitleBarBg,
          onTap: (index) {
            logic.setCurrentIndex(index);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<FramePage>();
    super.dispose();
  }
}
