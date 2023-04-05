import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  static const String _kThemePrefs = "isDarkMode";

  @override
  void onInit() {
    super.onInit();
    getThemeFromPrefs();
  }

  void getThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool(_kThemePrefs) ?? false;
    updateThemeMode();
  }

  void updateThemeMode() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    saveThemeToPrefs();
  }

  void saveThemeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_kThemePrefs, isDarkMode.value);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    updateThemeMode();

  }
}
