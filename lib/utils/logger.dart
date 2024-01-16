class Logger {
  static const String _TAG = 'Logger';

  static final Logger _instance = Logger();
  static bool _isDebugMode = false;

  static Logger getInstance() {
    return _instance;
  }

  Logger() {
    _isDebugMode = bool.fromEnvironment('DEBUG');
  }

  void log(String message, {LogLevel level = LogLevel.INFO}) {
    if (_isDebugMode) {
      print('[${_TAG}][${level.name}] $message');
    }
  }

  void debug(String message) {
    log(message, level: LogLevel.DEBUG);
  }

  void info(String message) {
    log(message, level: LogLevel.INFO);
  }

  void warn(String message) {
    log(message, level: LogLevel.WARN);
  }

  void error(String message) {
    log(message, level: LogLevel.ERROR);
  }

  void fatal(String message) {
    log(message, level: LogLevel.FATAL);
  }
}

enum LogLevel {
  DEBUG,
  INFO,
  WARN,
  ERROR,
  FATAL,
}
