import 'package:get/get.dart';

import '../../modules/frame/view.dart';
import '../../modules/list/list/view.dart';
import '../../modules/login/view.dart';
import '../../modules/test/view.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    //首页框架
    GetPage(
      name: AppRoutes.frame,
      page: () => FramePage(),
      // middlewares: [AuthMiddleWare()],
    ),
    //列表页
    GetPage(
        name: AppRoutes.list,
        page: () => ListPage(),
        transition: Transition.rightToLeft),
    //getX测试
    GetPage(
        name: AppRoutes.test,
        page: () => TestPage(),
        transition: Transition.rightToLeft),
    //登录
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        transition: Transition.downToUp)
  ];
}
