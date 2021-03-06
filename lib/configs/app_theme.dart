import 'package:fitness_application/configs/app_color.dart';
import 'package:fitness_application/configs/app_style.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  // TODO: Theme definitions
  static ThemeData get light => ThemeData(
        scaffoldBackgroundColor: AppColor.lightWhite,
        primaryColor: AppColor.lightPrimary,
        cardColor: AppColor.lightWhiteLight,
        canvasColor: AppColor.lightBlackLight,
        iconTheme: _lightIconThemeData,
        appBarTheme: _lightAppBarTheme,
        textTheme: _lightTextTheme,
        listTileTheme: _lightListTileThemeData,
        textButtonTheme: _lightTextButtonThemeData,
        elevatedButtonTheme: _lightElevatedButtonThemeData,
        floatingActionButtonTheme: _lightFloatingActionButtonThemeData,
        inputDecorationTheme: _lightInputDecorationTheme,
        splashColor: AppColor.lightPrimary,
        brightness: Brightness.light,
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.all(
            AppColor.lightWhiteLight,
          ),
          thumbColor: MaterialStateProperty.all(
            AppColor.lightPrimary,
          ),
        ),
        bottomSheetTheme: _lightBottomSheetThemeData,
        radioTheme: _lightRadioThemeData,
      );

  static ThemeData get dark => ThemeData(
        scaffoldBackgroundColor: AppColor.darkBlack,
        primaryColor: AppColor.darkPrimary,
        cardColor: AppColor.darkBlackLight,
        canvasColor: AppColor.darkWhiteLight,
        iconTheme: _darkIconThemeData,
        appBarTheme: _darkAppBarTheme,
        textTheme: _darkTextTheme,
        listTileTheme: _darkListTileThemeData,
        textButtonTheme: _darkTextButtonThemeData,
        elevatedButtonTheme: _darkElevatedButtonThemeData,
        floatingActionButtonTheme: _darkFloatingActionButtonThemeData,
        inputDecorationTheme: _darkInputDecorationTheme,
        splashColor: AppColor.darkPrimary,
        brightness: Brightness.dark,
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.all(
            AppColor.darkBlackLight,
          ),
          thumbColor: MaterialStateProperty.all(
            AppColor.darkPrimary,
          ),
        ),
        bottomSheetTheme: _darkBottomSheetThemeData,
        radioTheme: _darkRadioThemeData,
      );

  // Application physics
  static ScrollPhysics? get scrollPhysic => const BouncingScrollPhysics();

  // Animation duration
  static Duration get animationDuration => const Duration(milliseconds: 300);

  // Snackbar duration
  static Duration get snackbarDuration => const Duration(seconds: 5);

  // Icon theme
  static final IconThemeData _lightIconThemeData = IconThemeData(
    color: AppColor.lightBlackLight,
    // size: 16 * LayoutConstant.scaleFactor,
  );

  static final IconThemeData _darkIconThemeData = IconThemeData(
    color: AppColor.darkWhiteLight,
    // size: 16 * LayoutConstant.scaleFactor,
  );

  // App bar theme
  static final AppBarTheme _lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColor.lightWhite,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColor.lightBlackLight,
      // size: 16 * LayoutConstant.scaleFactor,
    ),
  );

  static final AppBarTheme _darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColor.darkBlack,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColor.darkWhiteLight,
      // size: 16 * LayoutConstant.scaleFactor,
    ),
  );

  // Text theme
  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: AppStyle.style1.copyWith(
      color: AppColor.lightBlackLight,
    ),
    displayMedium: AppStyle.style2.copyWith(
      color: AppColor.lightBlackLight,
    ),
    displaySmall: AppStyle.style8.copyWith(
      color: AppColor.lightBlackLight,
    ),
    headlineLarge: AppStyle.style6.copyWith(
      color: AppColor.lightBlackLight,
    ),
    headlineMedium: AppStyle.style7.copyWith(
      color: AppColor.lightBlackLight,
    ),
    titleLarge: AppStyle.style4.copyWith(
      color: AppColor.lightBlackLight,
    ),
    titleMedium: AppStyle.style5.copyWith(
      color: AppColor.lightBlackLight,
    ),
    bodyLarge: AppStyle.style9.copyWith(
      color: AppColor.lightBlackLight,
    ),
    bodyMedium: AppStyle.style10.copyWith(
      color: AppColor.lightBlackLight,
    ),
    labelLarge: AppStyle.style3.copyWith(
      color: AppColor.lightBlackLight,
    ),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: AppStyle.style1.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    displayMedium: AppStyle.style2.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    displaySmall: AppStyle.style8.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    headlineLarge: AppStyle.style6.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    headlineMedium: AppStyle.style7.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    titleLarge: AppStyle.style4.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    titleMedium: AppStyle.style5.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    bodyLarge: AppStyle.style9.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    bodyMedium: AppStyle.style10.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    labelLarge: AppStyle.style3.copyWith(
      color: AppColor.darkWhiteLight,
    ),
  );

  // List tile
  static final ListTileThemeData _lightListTileThemeData = ListTileThemeData(
    iconColor: AppColor.lightBlackLight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
    ),
  );

  static final ListTileThemeData _darkListTileThemeData = ListTileThemeData(
    iconColor: AppColor.darkWhiteLight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
    ),
  );

  // Text button
  static final TextButtonThemeData _lightTextButtonThemeData =
      TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        AppColor.lightWhite,
      ),
      foregroundColor: MaterialStateProperty.all(
        AppColor.lightBlackLight,
      ),
      textStyle: MaterialStateProperty.all(
        AppStyle.style7.copyWith(
          color: AppColor.lightBlackLight,
        ),
      ),
    ),
  );

  static final TextButtonThemeData _darkTextButtonThemeData =
      TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        AppColor.darkBlack,
      ),
      foregroundColor: MaterialStateProperty.all(
        AppColor.darkWhiteLight,
      ),
      textStyle: MaterialStateProperty.all(
        AppStyle.style7.copyWith(
          color: AppColor.darkWhiteLight,
        ),
      ),
    ),
  );

  // Elevated button
  static final ElevatedButtonThemeData _lightElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      animationDuration: AppTheme.animationDuration,
      backgroundColor: MaterialStateProperty.all(AppColor.lightPrimary),
      elevation: MaterialStateProperty.all(0.0),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24 * LayoutConstant.scaleFactor),
      ),
      fixedSize: MaterialStateProperty.all(
        Size(
          Get.width - 64 * LayoutConstant.scaleFactor,
          40 * LayoutConstant.scaleFactor,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        AppStyle.style7.copyWith(
          color: AppColor.lightWhiteLight,
        ),
      ),
    ),
  );

  static final ElevatedButtonThemeData _darkElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      animationDuration: AppTheme.animationDuration,
      backgroundColor: MaterialStateProperty.all(AppColor.darkPrimary),
      elevation: MaterialStateProperty.all(0.0),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24 * LayoutConstant.scaleFactor),
      ),
      fixedSize: MaterialStateProperty.all(
        Size(
          Get.width - 64 * LayoutConstant.scaleFactor,
          40 * LayoutConstant.scaleFactor,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        AppStyle.style7.copyWith(
          color: AppColor.darkWhiteLight,
        ),
      ),
    ),
  );

  // Floating button
  static final FloatingActionButtonThemeData
      _lightFloatingActionButtonThemeData = FloatingActionButtonThemeData(
    extendedSizeConstraints: BoxConstraints.tightFor(
      height: 40 * LayoutConstant.scaleFactor,
      width: Get.width - 64 * LayoutConstant.scaleFactor,
    ),
    backgroundColor: AppColor.lightPrimary,
    foregroundColor: AppColor.lightWhite,
    extendedTextStyle: AppStyle.style6,
  );

  static final FloatingActionButtonThemeData
      _darkFloatingActionButtonThemeData = FloatingActionButtonThemeData(
    extendedSizeConstraints: BoxConstraints.tightFor(
      height: 40 * LayoutConstant.scaleFactor,
      width: Get.width - 64 * LayoutConstant.scaleFactor,
    ),
    backgroundColor: AppColor.darkPrimary,
    foregroundColor: AppColor.lightWhite,
    extendedTextStyle: AppStyle.style6,
  );

  // Form Input
  static final InputDecorationTheme _lightInputDecorationTheme =
      InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: _outlineInputBorder,
    enabledBorder: _outlineInputBorder,
    focusedBorder: _outlineInputBorder,
    floatingLabelStyle: AppStyle.style8.copyWith(
      color: AppColor.lightBlackLight,
    ),
    labelStyle: AppStyle.style8.copyWith(
      color: AppColor.lightBlackLight,
    ),
    hintStyle: AppStyle.style8.copyWith(
      color: AppColor.lightBlackLight,
    ),
  );

  static final InputDecorationTheme _darkInputDecorationTheme =
      InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: _outlineInputBorder,
    enabledBorder: _outlineInputBorder,
    focusedBorder: _outlineInputBorder,
    floatingLabelStyle: AppStyle.style8.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    labelStyle: AppStyle.style8.copyWith(
      color: AppColor.darkWhiteLight,
    ),
    hintStyle: AppStyle.style8.copyWith(
      color: AppColor.darkWhiteLight,
    ),
  );

  static final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.darkWhiteLight,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(
      8 * LayoutConstant.scaleFactor,
    ),
  );

  // Bottom sheet
  static final BottomSheetThemeData _lightBottomSheetThemeData =
      BottomSheetThemeData(
    backgroundColor: AppColor.lightWhite,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
    ),
  );

  static final BottomSheetThemeData _darkBottomSheetThemeData =
      BottomSheetThemeData(
    backgroundColor: AppColor.darkBlack,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
    ),
  );

  // Radio
  static final RadioThemeData _lightRadioThemeData = RadioThemeData(
    fillColor: MaterialStateProperty.all(AppColor.lightPrimary),
  );

  static final RadioThemeData _darkRadioThemeData = RadioThemeData(
    fillColor: MaterialStateProperty.all(AppColor.lightPrimary),
  );
}
