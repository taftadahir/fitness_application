import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutCardComponent extends StatelessWidget {
  final Workout workout;
  const WorkoutCardComponent({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData? iconDataStatus;
    List<Widget> details = [];

    // Workout status
    if (workout.status == WorkoutStatus.completed) {
      iconDataStatus = Icons.done_rounded;
    } else if (workout.status == WorkoutStatus.reorder) {
      iconDataStatus = Icons.short_text_rounded;
    } else {
      iconDataStatus = EvaIcons.minus;
    }

    // Workout details
    if (workout.reps != null) {
      details.addAll([
        Text(
          '${workout.reps} reps',
          style: context.theme.textTheme.bodyMedium,
        ),
        SizedBox(
          width: LayoutConstant.spaceBetweenWorkoutDetail,
        ),
      ]);
    } else if (workout.time != null) {
      details.addAll([
        Text(
          '${workout.time} sec(s)',
          style: context.theme.textTheme.bodyMedium,
        ),
        SizedBox(
          width: LayoutConstant.spaceBetweenWorkoutDetail,
        )
      ]);
    }

    if (workout.weight != null) {
      details.addAll([
        Text(
          '${workout.weight} kg',
          style: context.theme.textTheme.bodyMedium,
        ),
        SizedBox(
          width: LayoutConstant.spaceBetweenWorkoutDetail,
        ),
      ]);
    }
    
    if (workout.restTime != null) {
      details.add(Text(
        workout.restTime != null
            ? '${workout.restTime} sec(s)'
            : 'No rest time',
        style: context.theme.textTheme.bodyMedium,
      ));
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutConstant.cardRadius),
      ),
      child: Container(
        constraints: BoxConstraints(
          minHeight: LayoutConstant.workoutCardHeight,
        ),
        padding: EdgeInsets.all(16.0 * LayoutConstant.scaleFactor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: AppTheme.scrollPhysic,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      workout.exerciseSysId,
                      style: context.theme.textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 8 * LayoutConstant.scaleFactor,
                    ),
                    Row(
                      children: details,
                    )
                  ],
                ),
              ),
            ),
            workout.status == WorkoutStatus.notStarted
                ? const SizedBox(
                    width: 0,
                  )
                : Icon(iconDataStatus)
          ],
        ),
      ),
    );
  }
}
