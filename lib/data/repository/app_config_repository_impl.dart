import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/data/cache/datasource/app_config_datasource.dart';
import 'package:movieapp_clean_arch/domain/repository/other/app_config_repository.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  final AppConfigDatasource _appConfigDatasource;

  AppConfigRepositoryImpl(this._appConfigDatasource);

  @override
  Future<ThemeMode> getThemeMode() {
    return _appConfigDatasource.getThemeMode().then((onValue) =>
        ThemeMode.values.find((value) => value.name == onValue) ??
        ThemeMode.dark);
  }

  @override
  void storeThemeMode(ThemeMode themeMode) {
    _appConfigDatasource.saveThemeMode(themeMode.name);
  }
}
