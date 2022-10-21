import 'package:flutter/material.dart';
import 'package:flutter_demo/common/utils/image_utils.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
      SizedBox banner = SizedBox(
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
      list.add(banner);

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
          child: SmartRefresher(
              controller: logic.refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: logic.onRefresh,
              onLoading: logic.onLoading,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return banner;
                  }

                  return ListTile(
                    title: Text(state.articleList[index - 1].title ?? ""),
                    onTap: () {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if(index == 0){
                    return const SizedBox();
                  }
                  return const Divider(
                    height: 1,
                    color: Colors.green,
                  );
                },
                itemCount: state.articleList.length,
              )),
        )),
      ]));
    });
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
