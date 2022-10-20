import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  int count = 0;

  void increment() {
    count++;
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
