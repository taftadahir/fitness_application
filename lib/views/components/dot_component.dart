import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotComponent extends StatelessWidget {
  final bool active;
  const DotComponent({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppTheme.animationDuration,
      height: active
          ? LayoutConstant.activeDotSize
          : LayoutConstant.inactiveDotSize,
      width: active
          ? LayoutConstant.activeDotSize
          : LayoutConstant.inactiveDotSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(active
            ? 4 * LayoutConstant.scaleFactor
            : 2 * LayoutConstant.scaleFactor),
        color: active ? context.theme.primaryColor : context.theme.cardColor,
      ),
    );
  }
}
