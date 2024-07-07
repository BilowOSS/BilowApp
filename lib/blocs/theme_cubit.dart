// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeMode = json['themeMode'] as String;

    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
    }

    return null;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    final values = <String, dynamic>{
      'themeMode': state.name,
    };

    return values;
  }

  void changeThemeMode(ThemeMode themeMode) {
    emit(themeMode);
  }

  void changeThemeModeToSystem() {
    emit(ThemeMode.system);
  }
}
