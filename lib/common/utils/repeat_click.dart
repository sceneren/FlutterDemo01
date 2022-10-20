
class RepeatClick {
  static var _lastPopTime = 0;

  // 防重复提交
  static checkClick(onClick, {int needTime = 700}) {
    if (_lastPopTime == 0 ||
        (DateTime.now().millisecondsSinceEpoch - _lastPopTime).abs() >
            needTime) {
      _lastPopTime = DateTime.now().millisecondsSinceEpoch;
      onClick();
    }
  }
}
