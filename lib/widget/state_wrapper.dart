import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../res/res.dart';
import '../res/colors.dart';

enum LoadState { loading, success, error, empty }

/// 统一缺省页
class StateWrapper extends StatelessWidget {
  //子控件
  Widget child;

  //当前状态
  LoadState state;

  Function? onRetry;

  StateWrapper(
      {Key? key, required this.child, required this.state, this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //和父布局一样的大小
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        _buildStateView(),
      ],
    );
  }

  Widget _buildStateView() {
    if (state == LoadState.loading) {
      return _loadingView();
    }
    if (state == LoadState.error) {
      return _errorView();
    }
    if (state == LoadState.empty) {
      return _emptyView();
    }
    return Container();
  }

  /// loading 页
  Widget _loadingView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorRes.color_F5F5F9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Res.lottiePageLoading,
              width: 200.h, height: 200.h, animate: true),
          Text(
            "正在获取数据...",
            style: TextStyle(color: ColorRes.color_AAAAB9, fontSize: 14.sp),
          )
        ],
      ),
    );
  }

  /// 空页面
  Widget _emptyView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorRes.color_F5F5F9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Res.bgLoginBottom,
            width: 150.w,
            height: 150.w,
          ),
          SizedBox(
            height: 37.h,
          ),
          Text(
            "无数据",
            style: TextStyle(color: ColorRes.color_AAAAB9, fontSize: 14.sp),
          )
        ],
      ),
    );
  }

  /// 错误界面
  Widget _errorView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorRes.color_F5F5F9,
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Res.bgLoginBottom,
              width: 150.w,
              height: 150.w,
            ),
            SizedBox(
              height: 37.h,
            ),
            Text(
              "加载异常",
              style: TextStyle(color: ColorRes.color_AAAAB9, fontSize: 14.sp),
            )
          ],
        ),
        onTap: () {
          onRetry?.call();
        },
      ),
    );
  }
}
