// 🐦 Flutter imports:
import 'package:bilow_app/blocs/blocs.dart';
import 'package:bilow_app/configs/configs.dart';
import 'package:bilow_app/extensions/extensions.dart';
import 'package:bilow_app/i18n/i18n.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:bilow_app/enums/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
  final _themeCubit = ThemeCubit();
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
      child: PlatformProvider(
        builder: (context) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            bloc: _themeCubit,
            builder: (context, themeMode) {
              return PlatformTheme(
                builder: (context) {
                  final i18n = context.i18n;

                  return PlatformApp.router(
                    debugShowCheckedModeBanner:
                        environment == Environment.development,
                    title: <String>[
                      i18n.general.appTitle,
                      environment.name.capitalize()
                    ].join(" "),
                    builder: (context, child) {
                      return ResponsiveBreakpoints.builder(
                        breakpoints: const <Breakpoint>[
                          Breakpoint(
                            start: 0,
                            end: 480,
                            name: MOBILE,
                          ),
                          Breakpoint(
                            start: 481,
                            end: 800,
                            name: TABLET,
                          ),
                          Breakpoint(
                            start: 801,
                            end: double.infinity,
                            name: DESKTOP,
                          ),
                        ],
                        child: child!,
                      );
                    },
                    locale: context.locale,
                    supportedLocales: AppLocaleUtils.supportedLocales,
                    localizationsDelegates: const <LocalizationsDelegate>[
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    routeInformationProvider:
                        _goRouter.routeInformationProvider,
                    routeInformationParser: _goRouter.routeInformationParser,
                    routerDelegate: _goRouter.routerDelegate,
                  );
                },
                themeMode: themeMode,
                materialLightTheme: kMaterialLightTheme,
                materialDarkTheme: kMaterialDarkTheme,
                cupertinoLightTheme: kCupertinoLightTheme,
                cupertinoDarkTheme: kCupertinoDarkTheme,
                onThemeModeChanged: (themeMode) {
                  if (themeMode == null) {
                    return;
                  }

                  _themeCubit.changeThemeMode(themeMode);
                },
              );
            },
          );
        },
      ),
    );
  }
}
