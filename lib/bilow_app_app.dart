// 🐦 Flutter imports:
import 'package:bilow_app/extensions/extensions.dart';
import 'package:bilow_app/i18n/i18n.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:bilow_app/enums/enums.dart';
import 'package:bilow_app/pages/pages.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<Widget> bilowApp({
  required Environment environment,
  void Function()? extra,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  extra?.call();

  return AppInfo(
    data: await AppInfoData.get(),
    child: BilowAppApp(
      environment: environment,
    ),
  );
}

class BilowAppApp extends StatelessWidget {
  const BilowAppApp({
    required this.environment,
    super.key,
  });

  final Environment environment;

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: Builder(builder: (context) {
        final i18n = context.i18n;

        return MaterialApp(
          debugShowCheckedModeBanner: environment == Environment.development,
          title: '${i18n.general.appTitle} ${environment.name.capitalize()}',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
            ),
            useMaterial3: true,
          ),
          locale: context.locale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: const <LocalizationsDelegate>[
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: HomePage(
            title: i18n.homePage.title,
          ),
        );
      }),
    );
  }
}
