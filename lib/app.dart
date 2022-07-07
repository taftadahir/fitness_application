import 'package:fitness_application/bindings/app_binding.dart';
import 'package:fitness_application/configs/app_route.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/app_constant.dart';
import 'package:fitness_application/languages/app_message.dart';
import 'package:fitness_application/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Remove splash screen after initialization is completed
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      title: AppConstant.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.initialRoute,
      getPages: AppRoute.pages,
      initialBinding: AppBinding(),
      translations: AppMessage(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeService.theme,
      onInit: () async {},
    );
  }
}
