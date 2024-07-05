// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_app_info/flutter_app_info.dart';

// 🌎 Project imports:
import 'package:bilow_app/i18n/i18n.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension BuildingContextExtension on BuildContext {
  AppInfoData get appInfo => AppInfo.of(this);

  InheritedLocaleData<AppLocale, TranslationsEn> get translationProvider {
    return TranslationProvider.of(this);
  }

  Locale get locale => translationProvider.flutterLocale;

  MediaQueryData get media => MediaQuery.of(this);

  ResponsiveBreakpointsData get breakpoints => ResponsiveBreakpoints.of(this);

  ThemeData get theme => Theme.of(this);
  TranslationsEn get i18n => t;
}
