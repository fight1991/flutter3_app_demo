// 打印

class LogUtils {
  // 是否输入日志
  static bool _isLog = true;
  static String _logFlag = 'flutter_print_log';

  static void init({bool isLog = false, String logFlag = 'flutter_print_log'}) {
    _isLog = isLog;
    _logFlag = logFlag;
  }

  static void e(String message) {
    if (_isLog) {
      print('$_logFlag | $message');
    }
  }
}
