import 'package:demo01/common/routes/app_routes.dart';
import 'package:demo01/modules/list/list_page.dart';
import 'package:demo01/modules/login/view.dart';
import 'package:demo01/modules/test/view.dart';
import 'package:get/get.dart';

import '../../modules/frame/view.dart';

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
        page: () => const ListPage(),
        transition: Transition.leftToRight),
    //getX测试
    GetPage(
        name: AppRoutes.test,
        page: () => TestPage(),
        transition: Transition.leftToRight),
    //登录
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        transition: Transition.downToUp)
  ];
}
