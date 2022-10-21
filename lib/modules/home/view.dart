import 'package:flutter/material.dart';
import 'package:flutter_demo/common/utils/image_utils.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import '../../widget/base_root_view.dart';
import '../../widget/custom_top_bar.dart';
import 'logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      List<Widget> list = [];
      SizedBox sizedBox = SizedBox(
        height: 300.w,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return cachedImage(state.bannerList[index].imagePath ?? "");
          },
          itemCount: state.bannerList.length,
          key: UniqueKey(),
          pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: ColorRes.color_AAAAB9,
            activeColor: ColorRes.colorBackground,
            size: 6,
            activeSize: 6,
          )),
        ),
      );
      list.add(sizedBox);
      for (int i = 0; i < 20; i++) {
        list.add(ListTile(
          title: Text("item_$i"),
          onTap: () {},
        ));
      }
      List<Widget> divideList =
          ListTile.divideTiles(context: context, tiles: list).toList();
      return BaseRootView(
          child: Column(children: [
        const CustomTitleBar(
          title: StringRes.home,
          isShowBack: false,
        ),
        Expanded(
            child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            children: divideList,
          ),
        ))
      ]));
    });
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
