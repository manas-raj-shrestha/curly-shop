class AppLogger {
  late String className;

  static final Map<String, AppLogger> _classInstanceMapper = {};

  factory AppLogger.instantiate(String className) {
    return _classInstanceMapper.putIfAbsent(
        className, () => AppLogger._internal(className));
  }

  AppLogger._internal(this.className) {
    print('Logger instantiated for $className');
  }

  void log(String message) {
    print('$className: $message');
  }
}
