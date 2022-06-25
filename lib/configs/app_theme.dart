import 'package:fitness_application/configs/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // TODO: Theme definitions
  static ThemeData get light => ThemeData(
        scaffoldBackgroundColor: AppColor.lightWhite,
      );

  static ThemeData get dark => ThemeData(
        scaffoldBackgroundColor: AppColor.darkBlack,
      );

  // Application physics
  static ScrollPhysics? get scrollPhysic => const BouncingScrollPhysics();

  // Animation duration
  static Duration get animationDuration => const Duration(milliseconds: 300);
}
