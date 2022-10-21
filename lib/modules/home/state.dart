import 'package:flutter_demo/data/models/article_mo.dart';
import 'package:flutter_demo/data/models/banner_info.dart';
import 'package:get/get.dart';

class HomeState {
  var bannerList = RxList<BannerInfo>();
  var articleList = RxList<ArticleMo>();

  HomeState();
}
