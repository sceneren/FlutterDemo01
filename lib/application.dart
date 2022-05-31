import 'dart:ui';

import 'package:demo01/common/routes/app_pages.dart';
import 'package:demo01/common/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/observers/my_route_observer.dart';
import 'common/utils/view_utils.dart';

/// desktop 下拉组件需要支持鼠标  https://flutter.cn/docs/release/breaking-changes/default-scroll-behavior-drag#migration-guide
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

MyRouteObserver<PageRoute> myRouteObserver = MyRouteObserver<PageRoute>();

//监听单个页面
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

/// app 启动时启动的第一个组件
class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 启用状态栏
    showStatusBar(true);
    setStatusBarColor();

    // 屏幕适配组件
    // In first method you only need to wrap [MaterialApp] with [ScreenUtilInit] and that's it

    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MediaQuery(
          data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .copyWith(textScaleFactor: 1.0),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorObservers: [
              // myRouteObserver,
              routeObserver,
            ],
            scrollBehavior: MyCustomScrollBehavior(),
            //全局loading
            builder: EasyLoading.init(),
            initialRoute: AppRoutes.frame,
            getPages: AppPages.pages,
          ),
        );
      },
    );
  }
}
