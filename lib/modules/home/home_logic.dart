import 'package:flutter_demo/common/app_ext.dart';
import 'package:flutter_demo/common/controllers/base_page_controller.dart';
import 'package:flutter_demo/common/utils/log_utils.dart';
import 'package:flutter_demo/data/base/base_page_mo.dart';
import 'package:flutter_demo/data/models/article_mo.dart';
import 'package:flutter_demo/data/models/banner_info.dart';
import 'package:flutter_demo/widget/refresh/refresh_ext.dart';
import 'package:get/get.dart';

import '../../data/repositories/wan_repository.dart';
import 'home_state.dart';

class HomeLogic extends BasePageController {
  final HomeState state = HomeState();

  @override
  void onReady() {
    super.onReady();
    requestData(Refresh.down, BasePageController.defaultPage);
    getBannerData();
  }

  void getBannerData() async {
    asyncRequest(
      () => WanRepository.to.banner(),
      onSuccess: (data) {
        BannerListInfo bannerListInfo = BannerListInfo.fromJson(data);
        state.bannerList.assignAll(bannerListInfo.bannerList);
        update();
      },
      onFailure: (error, code, msg) {
        logger.e("error:$error,code:$code,msg:$msg");
      },
    );
  }

  @override
  void requestData(Refresh refresh, int page, [bool isFirst = true]) async {
    if (page == BasePageController.defaultPage) {
      getBannerData();
    }
    asyncRequest(
      () => WanRepository.to.articleList(page),
      onSuccess: (data) {
        BasePageMo<ArticleMo> basePageMo = BasePageMo.fromJson(data, (json) {
          return ArticleMo.fromJson(json);
        });

        if (refresh == Refresh.down) {
          state.articleList.clear();
        }
        if (basePageMo.datas != null) {
          state.articleList.addAll(basePageMo.datas!);
        }

        if (isFirst) {
          showSuccess(state.articleList.isEmpty);
        }
        updatePage(page);
        RefreshExt.onSuccess(refreshController, refresh,
            basePageMo.curPage! >= basePageMo.pageCount!);
        update();
      },
      onFailure: (error, code, msg) {
        RefreshExt.onError(refreshController, refresh);
      },
    );
  }
}
