import 'package:movieapp_clean_arch/domain/general/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigDatasource {
  static final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  final String _PREF_KEY_THEME_MODE = "key.thememode";
  final String _PREF_KEY_LOCALIZATION = "key.localization";

  void saveThemeMode(String themeMode) {
    _prefs.setString(_PREF_KEY_THEME_MODE, themeMode);
  }

  Future<String?> getThemeMode() {
    return _prefs.getString(_PREF_KEY_THEME_MODE);
  }

  void saveLocalization(String localeCode) {
    _prefs.setString(_PREF_KEY_LOCALIZATION, localeCode);
  }

  Future<String> getLocalization() {
    return _prefs
        .getString(_PREF_KEY_LOCALIZATION)
        .then((onValue) => onValue ?? Localization.ENGLISH);
  }
}
