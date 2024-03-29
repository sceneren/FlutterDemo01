import 'package:flutter_demo/widget/state_wrapper.dart';
import 'package:get/get.dart';

/// 缺省页
/// 增加生命周期 FullLifeCycleController with FullLifeCycleMixin
abstract class BaseEmptyController extends GetxController {
  ///加载状态  0加载中 1加载成功 2加载数据为空 3加载失败
  var loadState = LoadState.loading;

  ///加载成功，是否显示空页面
  void showSuccess(bool isEmpty) {
    loadState = isEmpty ? LoadState.empty : LoadState.success;
    update();
  }

  ///加载失败,显示失败页面
  void showError() {
    loadState = LoadState.error;
    update();
  }

  ///重新加载
  void showLoading() {
    loadState = LoadState.loading;
    update();
  }
}
