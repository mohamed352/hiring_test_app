import 'package:logger/logger.dart';

enum LogTags {
  bloc,
  cache,
  network,
  camera,
  scanner,
  inspection,
  auth,
  error,
  navigation,
  app,
}

class AppLogger {
  // Use a customized printer or PrettyPrinter for nice output
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void d(String message, {LogTags? tag}) {
    _logger.d(_format(message, tag));
  }

  static void i(String message, {LogTags? tag}) {
    _logger.i(_format(message, tag));
  }

  static void w(String message, {LogTags? tag}) {
    _logger.w(_format(message, tag));
  }

  static void e(
    String message, {
    LogTags? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.e(_format(message, tag), error: error, stackTrace: stackTrace);
  }

  static String _format(String message, LogTags? tag) {
    if (tag != null) {
      return '[${tag.name.toUpperCase()}] $message';
    }
    return message;
  }
}

// Global accessor for convenience, or strictly use AppLogger static methods.
// The AI Rules say: log.d('...'), so we can expose a global variable or alias if needed,
// but usually static access AppLogger.d is clearer.
// For strict compliance with rules showing `log.d`:
final log = _LogBridge();

class _LogBridge {
  void d(String message, {LogTags? tag}) => AppLogger.d(message, tag: tag);
  void i(String message, {LogTags? tag}) => AppLogger.i(message, tag: tag);
  void w(String message, {LogTags? tag}) => AppLogger.w(message, tag: tag);
  void e(
    String message, {
    LogTags? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) => AppLogger.e(message, tag: tag, error: error, stackTrace: stackTrace);
}
