import 'package:get/get.dart';

import 'state.dart';

class FrameLogic extends GetxController {
  final FrameState state = FrameState();

  void setCurrentIndex(int index) {
    if (index != state.currentIndex) {
      state.currentIndex = index;
      update();
    }
  }
}
