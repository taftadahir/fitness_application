import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopUpComponent {
  static void dialog(
    BuildContext context, {
    required String title,
    required String message,
    String? validateText,
    String? cancelText,
    VoidCallback? onPressedValidate,
    VoidCallback? onPressedCancel,
  }) {
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(
          vertical: LayoutConstant.screenPadding,
          horizontal: LayoutConstant.screenPadding,
        ),
        insetAnimationDuration: AppTheme.animationDuration,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: LayoutConstant.screenPadding,
            horizontal: LayoutConstant.screenPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: context.theme.textTheme.titleLarge,
              ),
              SizedBox(
                height: LayoutConstant.screenPadding,
              ),
              Text(
                message,
                style: context.theme.textTheme.bodyLarge,
              ),
              SizedBox(
                height: 2 * LayoutConstant.screenPadding,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: onPressedValidate != null &&
                        validateText != null &&
                        onPressedCancel != null &&
                        cancelText != null
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center,
                children: [
                  onPressedCancel != null && cancelText != null
                      ? ElevatedButton(
                          onPressed: onPressedCancel,
                          style:
                              context.theme.elevatedButtonTheme.style!.copyWith(
                            backgroundColor: MaterialStateProperty.all(
                                context.theme.cardColor),
                            fixedSize: MaterialStateProperty.all(
                              Size(
                                !(onPressedValidate != null &&
                                        validateText != null)
                                    ? Get.width -
                                        128 * LayoutConstant.scaleFactor
                                    : double.infinity,
                                32 * LayoutConstant.scaleFactor,
                              ),
                            ),
                          ),
                          child: Text(
                            cancelText,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  SizedBox(
                    width: onPressedValidate != null && validateText != null
                        ? 8 * LayoutConstant.scaleFactor
                        : 0,
                  ),
                  onPressedValidate != null && validateText != null
                      ? ElevatedButton(
                          onPressed: onPressedValidate,
                          style:
                              context.theme.elevatedButtonTheme.style!.copyWith(
                            fixedSize: MaterialStateProperty.all(
                              Size(
                                !(onPressedCancel != null && cancelText != null)
                                    ? Get.width -
                                        128 * LayoutConstant.scaleFactor
                                    : double.infinity,
                                32 * LayoutConstant.scaleFactor,
                              ),
                            ),
                          ),
                          child: Text(
                            validateText,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                ],
              )
            ],
          ),
        ),
      ),
      barrierDismissible: true,
      name: 'Confirmation',
      transitionDuration: AppTheme.animationDuration,
    );
  }
}
