import 'package:get/get.dart';

import 'state.dart';

class TestLogic extends GetxController {
  final TestState state = TestState();

  ///自增
  void increase() {
    state.count = ++state.count;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
