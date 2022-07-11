import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';

class TimerComponent extends StatelessWidget {
  final String description;
  final int count;
  final int initialCount;
  const TimerComponent({
    Key? key,
    required this.count,
    required this.initialCount,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: LayoutConstant.circularTimerRadius,
      lineWidth: 8 * LayoutConstant.scaleFactor,
      percent: percent,
      progressColor: context.theme.primaryColor,
      backgroundColor: context.theme.cardColor,
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
      animationDuration: AppTheme.animationDuration.inSeconds,
      center: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$count',
              style: context.theme.textTheme.displayLarge,
            ),
            SizedBox(
              height: 4 * LayoutConstant.scaleFactor,
            ),
            Text(
              description,
              style: context.theme.textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }

  double get percent {
    return initialCount == 0
        ? 1
        : ((initialCount - count) / initialCount);
  }
}
