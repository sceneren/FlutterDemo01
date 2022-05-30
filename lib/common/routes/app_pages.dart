import 'package:demo01/modules/frame/frame_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final List<GetPage> pages = [
  //首页框架
  GetPage(
    name: AppRoutes.frame,
    page: () => const FramePage(),
    // middlewares: [AuthMiddleWare()],
  ),
  GetPage(
      name: AppRoutes.list,
      page: () => const ListPage()
  ),
];}
