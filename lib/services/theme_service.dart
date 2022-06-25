import 'package:fitness_application/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ThemeService {
  static ThemeMode get theme {
    if (StorageService.isFirstTimeOpeningApp) {
      final isLight = SchedulerBinding.instance.window.platformBrightness ==
          Brightness.light;
      return isLight ? ThemeMode.light : ThemeMode.dark;
    }
    return StorageService.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static void switchTheme() {
    // Change the app theme
    Get.changeThemeMode(
      StorageService.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );

    // Save the new theme
    StorageService.isDarkMode = !StorageService.isDarkMode;
  }
}
