import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateThemeMode(ThemeMode themeMode) {
    emit(themeMode);
    print('theme changed to $themeMode');
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final mode = json['theme'] as String?;
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    String mode;
    switch (state) {
      case ThemeMode.light:
        mode = 'light';
        break;
      case ThemeMode.dark:
        mode = 'dark';
        break;
      case ThemeMode.system:
      mode = 'system';
        break;
    }
    return {'theme': mode};
  }
}
