import 'package:fitness_application/configs/app_color.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayComponent extends StatelessWidget {
  final int day;
  final bool active;
  final bool completed;

  const DayComponent({
    Key? key,
    required this.day,
    this.active = false,
    this.completed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProgramController controller = Get.find();
        controller.activeDay = day;
      },
      child: AnimatedContainer(
        duration: AppTheme.animationDuration,
        height: LayoutConstant.daySize,
        width: LayoutConstant.daySize,
        padding: EdgeInsets.all(4 * LayoutConstant.scaleFactor),
        decoration: BoxDecoration(
          color: completed
              ? (active ? AppColor.darkPrimary : context.theme.cardColor)
              : Colors.transparent,
          border: Border.all(
            color: active ? AppColor.darkPrimary : context.theme.cardColor,
            width: LayoutConstant.scaleFactor,
          ),
          shape: BoxShape.circle,
        ),
        child: AnimatedContainer(
          duration: AppTheme.animationDuration,
          decoration: BoxDecoration(
            color: active ? AppColor.darkPrimary : context.theme.cardColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                day.toString(),
                style: !active && !completed
                    ? context.theme.textTheme.bodyMedium
                    : context.theme.textTheme.bodyMedium!.copyWith(
                        color: AppColor.darkWhiteLight,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
