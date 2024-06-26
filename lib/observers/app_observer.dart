import 'package:bilow_app/abstracts/abstracts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AppObserver extends BlocObserver {
  AppObserver({
    LoggerUtility? loggerUtility,
  }) : _loggerUtility = loggerUtility ?? GetIt.instance.get<LoggerUtility>();

  final LoggerUtility _loggerUtility;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    _loggerUtility.log(
      'onChange(${bloc.runtimeType}, $change)',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _loggerUtility.log(
      'onError(${bloc.runtimeType}, $error, $stackTrace)',
      level: LogLevel.error,
    );

    super.onError(bloc, error, stackTrace);
  }
}
