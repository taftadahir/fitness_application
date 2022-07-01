import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';

class ResultComponent extends StatelessWidget {
  final List<Workout> workouts;
  const ResultComponent({
    Key? key,
    required this.workouts,
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
              '${(100 * percent).toInt()} %',
              style: context.theme.textTheme.displayLarge,
            ),
            SizedBox(
              height: 4 * LayoutConstant.scaleFactor,
            ),
            Text(
              'Completed workouts',
              style: context.theme.textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }

  double get percent {
    return workouts
            .where((workout) => workout.status == WorkoutStatus.completed)
            .length /
        (workouts.isEmpty ? 1 : workouts.length);
  }
}
