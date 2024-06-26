abstract class LoggerUtility {
  void log(
    message, {
    LogLevel level = LogLevel.debug,
    StackTrace? stackTrace,
  });
}

enum LogLevel {
  debug,
  error,
  fatal,
  info,
  trace,
  warning,
}
