import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../provider/api/api_client.dart';

/// 数据仓库
class WanRepository extends GetxService {
  static WanRepository get to => Get.find();

  late ApiClient client;

  WanRepository(this.client);

  /// 获取首页分类
  Future<Response> loadHomeCategory(String categoryName, int pageIndex) {
    return client.fire(RequestMethod.get, "/fa/home/$categoryName",
        params: {"pageIndex": pageIndex, "pageSize": 20});
  }

  /// 获取视频详情
  Future<Response> loadVideoDetail(String? vid) {
    return client.fire(RequestMethod.get, "/fa/detail/$vid");
  }

  /// 通过sort获取排行数据
  Future<Response> loadRankingDataBySort(String? sort, int pageIndex) {
    return client.fire(RequestMethod.get, "/fa/ranking",
        params: {"pageIndex": pageIndex, "pageSize": 10, "sort": sort});
  }

  /// 获取banner
  Future<Response> banner() {
    return client.fire(RequestMethod.get, "/banner/json");
  }
}
