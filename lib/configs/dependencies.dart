import 'package:bilow_app/abstracts/abstracts.dart';
import 'package:bilow_app/i18n/i18n.dart';
import 'package:bilow_app/observers/observers.dart';
import 'package:bilow_app/utilities/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:url_strategy/url_strategy.dart';

Future<void> initDependencies({
  void Function()? extra,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  GoRouter.optionURLReflectsImperativeAPIs = true;

  setPathUrlStrategy();

  await Hive.initFlutter();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  extra?.call();

  final dependencies = GetIt.instance;

  _initUtilities(dependencies);

  Bloc.observer = AppObserver();
  FlutterError.onError = (details) {
    dependencies.get<LoggerUtility>().log(
          details.exceptionAsString(),
          stackTrace: details.stack,
        );
  };
}

void _initUtilities(GetIt dependencies) {
  dependencies.registerFactory<LoggerUtility>(PrettyLoggerUtility.new);
}
