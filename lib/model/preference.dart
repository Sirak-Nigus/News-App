import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppPreference {
  static const THEME_SETTING = "THEMESETTING";

  setThemePref(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_SETTING, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_SETTING) ?? false;
  }
}

class AppModel extends ChangeNotifier {
  AppPreference appPreference = AppPreference();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    print('Provider:$_darkTheme');
    appPreference.setThemePref(value);
    notifyListeners();
  }

  notifyListeners();
}
