class Constants {
  /// ---------------- 缺省页 ----------------
  static const empty = 0;
  static const success = 1;
  static const loading = 2;
  static const error = 3;

  /// ---------------- 网络 ----------------
  // static const baseUrl = "https://api.devio.org/uapi";
  static const baseUrl = "https://www.wanandroid.com";

  //用户登录后,产生的令牌
  static const boardingPass = "33665CA3F23FEFE277A747A423BD9D43AF";
  static const courseFlag = "fa";

  //请求接口需要的token,定期修改,先本地写死
  static const authToken = "ZmEtMjAyMS0wNC0xMiAyMToyMjoyMC1mYQ==fa";

  // socket 请求头
  static barrageHeaders() {
    Map<String, dynamic> header = {
      "auth-token": authToken,
      "course-flag": courseFlag,
      "boarding-pass": boardingPass
    };
    return header;
  }

  /// ---------------- 常量 ----------------
  static const vid = "vid";
  static const isLogin = "isLogin";
}
