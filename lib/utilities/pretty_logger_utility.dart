// 📦 Package imports:
import 'package:logger/logger.dart';

// 🌎 Project imports:
import 'package:bilow_app/abstracts/abstracts.dart';

class PrettyLoggerUtility implements LoggerUtility {
  PrettyLoggerUtility({Logger? logger})
      : _logger = logger ??
            Logger(
              printer: PrettyPrinter(
                colors: true,
                printEmojis: true,
                printTime: true,
              ),
            );

  final Logger _logger;

  @override
  void log(
    message, {
    LogLevel level = LogLevel.debug,
    StackTrace? stackTrace,
  }) {
    switch (level) {
      case LogLevel.error:
        return _logger.e(message, stackTrace: stackTrace);
      case LogLevel.warning:
        return _logger.w(message, stackTrace: stackTrace);
      case LogLevel.trace:
        return _logger.t(message, stackTrace: stackTrace);
      case LogLevel.debug:
        return _logger.d(message, stackTrace: stackTrace);
      case LogLevel.info:
        return _logger.i(message, stackTrace: stackTrace);
      case LogLevel.fatal:
        return _logger.f(message, stackTrace: stackTrace);
    }
  }
}
