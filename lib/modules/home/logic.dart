import 'package:flutter_demo/common/app_ext.dart';
import 'package:flutter_demo/common/utils/log_utils.dart';
import 'package:flutter_demo/data/models/banner_info.dart';
import 'package:get/get.dart';

import '../../data/repositories/wan_repository.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  @override
  void onReady() {
    super.onReady();
    getBannerData();
  }

  void getBannerData() {
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
}
