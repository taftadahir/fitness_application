import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SnackBarComponent {
  static void snackbar(
    BuildContext context, {
    String? title,
    required String message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        animationDuration: AppTheme.animationDuration,
        duration: AppTheme.snackbarDuration,
        backgroundColor: context.theme.snackBarTheme.backgroundColor ??
            context.theme.cardColor,
        isDismissible: true,
        margin: EdgeInsets.symmetric(
          horizontal: LayoutConstant.screenPadding,
          vertical: LayoutConstant.screenPadding,
        ),
        messageText: Text(
          message,
          style: context.theme.textTheme.bodySmall,
        ),
        title: title,
        borderRadius: LayoutConstant.cardRadius,
        snackPosition: SnackPosition.TOP,
      ),
    );
  }
}
