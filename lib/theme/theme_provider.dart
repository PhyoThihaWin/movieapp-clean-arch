import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/data/repository_provider.dart';
import 'package:movieapp_clean_arch/domain/repository/other/app_config_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

/// Theme Provider
// class ThemeProvider extends ChangeNotifier {
//   ThemeMode currentTheme = ThemeMode.system;

//   final AppConfigRepository _repository =
//       AppConfigRepositoryImpl(AppConfigDatasource());

//   setInitialTheme() async {
//     currentTheme = await _repository.getThemeMode();
//     notifyListeners();
//   }

//   changeCurrentTheme() {
//     currentTheme =
//         currentTheme == ThemeMode.system ? ThemeMode.dark : ThemeMode.system;
//     _repository.storeThemeMode(currentTheme);
//     notifyListeners();
//   }
// }

@riverpod
class CurrentThemeMode extends _$CurrentThemeMode {
  late AppConfigRepository _repsository;
  @override
  Future<ThemeMode> build() {
    _repsository = ref.read(appConfigRepositoryProvider);
    return _repsository.getThemeMode();
  }

  updateThemeMode() {
    var theme = state.requireValue == ThemeMode.system
        ? ThemeMode.dark
        : ThemeMode.system;
    state = AsyncData(theme);
    _repsository.storeThemeMode(theme);
  }
}

// class LocalizationProvider extends ChangeNotifier {
//   String localeCode = Localization.ENGLISH;

//   final AppConfigRepository _repository =
//       AppConfigRepositoryImpl(AppConfigDatasource());

//   setInitialLocalization() async {
//     localeCode = await _repository.getLocalization();
//     notifyListeners();
//   }

//   Future<void> changeLocalization(
//       BuildContext context, String localeCode) async {
//     this.localeCode = localeCode;
//     _repository.storeLocalization(localeCode);
//     notifyListeners();

//     await context.setLocale(Locale(localeCode));
//   }
// }