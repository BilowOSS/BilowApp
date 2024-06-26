// 🐦 Flutter imports:
import 'package:bilow_app/configs/configs.dart';
import 'package:bilow_app/extensions/extensions.dart';
import 'package:bilow_app/i18n/i18n.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:bilow_app/enums/enums.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class BilowAppApp extends StatefulWidget {
  const BilowAppApp({
    required this.environment,
    super.key,
  });

  final Environment environment;

  @override
  State<BilowAppApp> createState() => _BilowAppAppState();
}

class _BilowAppAppState extends State<BilowAppApp> {
  final _goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: $appRoutes,
    errorBuilder: (context, state) {
      return const ErrorRoute().build(
        context,
        state,
      );
    },
    initialLocation: const HomeRoute().location,
    debugLogDiagnostics: true,
  );

  @override
  Widget build(BuildContext context) {
    final environment = widget.environment;

    return TranslationProvider(
      child: Builder(
        builder: (context) {
          final i18n = context.i18n;

          return PlatformApp.router(
            debugShowCheckedModeBanner: environment == Environment.development,
            title: '${i18n.general.appTitle} ${environment.name.capitalize()}',
            locale: context.locale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: const <LocalizationsDelegate>[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            routeInformationProvider: _goRouter.routeInformationProvider,
            routeInformationParser: _goRouter.routeInformationParser,
            routerDelegate: _goRouter.routerDelegate,
            material: (_, __) {
              return MaterialAppRouterData(
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
              );
            },
            cupertino: (_, __) {
              return CupertinoAppRouterData();
            },
          );
        },
      ),
    );
  }
}
