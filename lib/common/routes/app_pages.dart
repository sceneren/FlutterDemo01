import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:demo01/modules/frame/frame_page.dart';
import 'package:demo01/common/routes/app_routes.dart';
import 'package:demo01/modules/list/list_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    //首页框架
    GetPage(
      name: AppRoutes.frame,
      page: () => const FramePage(),
      // middlewares: [AuthMiddleWare()],
    ),
    //列表页
    GetPage(name: AppRoutes.list, page: () => ListPage())
  ];
}
