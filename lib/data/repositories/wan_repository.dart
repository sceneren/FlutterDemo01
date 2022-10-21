import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../provider/api/api_client.dart';

/// 数据仓库
class WanRepository extends GetxService {
  static WanRepository get to => Get.find();

  late ApiClient client;

  WanRepository(this.client);

  /// 获取banner
  Future<Response> banner() {
    return client.fire(RequestMethod.get, "banner/json");
  }

  /// 首页文章列表
  Future<Response> articleList(int page) {
    return client.fire(RequestMethod.get, "article/list/$page/json",params: {"page_size":40});
  }
}
