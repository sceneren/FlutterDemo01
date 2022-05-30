import 'package:get/get.dart';

class AppRoutes {
  /// 框架启动
  static const String frame = "/frame";

  /// 登录
  static const String login = "/login";

  /// 列表
  static const String list = "/list";

  /// 跳转首页
  static void toMain() {
    Get.offNamed(frame);
  }
}
