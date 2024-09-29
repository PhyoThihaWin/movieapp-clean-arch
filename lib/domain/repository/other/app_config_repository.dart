import 'package:flutter/material.dart';

abstract interface class AppConfigRepository {
  void storeThemeMode(ThemeMode themeMode);
  Future<ThemeMode> getThemeMode();
}
