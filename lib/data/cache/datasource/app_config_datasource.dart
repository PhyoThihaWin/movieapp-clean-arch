import 'package:dart_extensions/dart_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigDatasource {
  static final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  final String _PREF_KEY_THEME_MODE = "key.thememode";

  void saveThemeMode(String themeMode) {
    _prefs.setString(_PREF_KEY_THEME_MODE, themeMode);
  }

  Future<String?> getThemeMode() {
    return _prefs.getString(_PREF_KEY_THEME_MODE);
  }
}
