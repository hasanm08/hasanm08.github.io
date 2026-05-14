import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists theme mode and locale for the portfolio shell.
class AppSettings extends ChangeNotifier {
  AppSettings() {
    _load();
  }

  static const _keyTheme = 'app_theme_mode';
  static const _keyLocale = 'app_locale';

  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  bool get isDarkActive {
    switch (_themeMode) {
      case ThemeMode.dark:
        return true;
      case ThemeMode.light:
        return false;
      case ThemeMode.system:
        return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    }
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeName = prefs.getString(_keyTheme);
      if (themeName != null) {
        _themeMode = ThemeMode.values.firstWhere(
          (m) => m.name == themeName,
          orElse: () => ThemeMode.system,
        );
      }
      final code = prefs.getString(_keyLocale);
      if (code == 'fa' || code == 'en') {
        _locale = Locale(code!);
      }
    } catch (_) {
      // Ignore storage failures (e.g. privacy mode); defaults apply.
    }
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyTheme, mode.name);
    } catch (_) {}
  }

  void cycleTheme() {
    final next = switch (_themeMode) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };
    setThemeMode(next);
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyLocale, locale.languageCode);
    } catch (_) {}
  }

  void toggleLocale() {
    setLocale(_locale.languageCode == 'fa'
        ? const Locale('en')
        : const Locale('fa'));
  }
}
