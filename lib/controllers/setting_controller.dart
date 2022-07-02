import 'package:fitness_application/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  // Theme
  late bool _isDark;

  // Language
  late Locale _language;

  // Count down in seconds
  late int _countDown;

  // Unit
  late String _unit;

  // Getter & setter for _isDarkTheme
  bool get isDark => _isDark;
  set isDark(bool isDark) {
    if (_isDark && !isDark || !_isDark && isDark) {
      ThemeService.switchTheme();
      _isDark = isDark;
      update();
    }
  }

  // Getter & setter for language
  Locale get language => _language;
  set language(Locale language) {
    update();
  }

  // Getter & setter for Count down
  int get countDown => _countDown;
  set countDown(int countDown) {
    update();
  }

  // Getter & setter for unit
  String get unit => _unit;
  set unit(String unit) {
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _isDark = ThemeService.theme == ThemeMode.dark;
  }
}
