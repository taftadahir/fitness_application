import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/models/exercise.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatisticCardComponent extends StatelessWidget {
  final Exercise exercise;
  final List<Workout> workouts;
  const StatisticCardComponent({
    Key? key,
    required this.exercise,
    required this.workouts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> details = [];
    int? repsMin,
        repsMax,
        weightMin,
        weightMax,
        timeMin,
        timeMax,
        restTimeMin,
        restTimeMax;
    int completedWorkouts = 0;
    double percent = 0;

    // Workout details
    for (var workout in workouts) {
      completedWorkouts++;
      // Reps
      if (workout.reps != null) {
        // Check if repsMin is not null and greater than the workout reps
        if (repsMin != null && workout.reps! < repsMin) {
          repsMin = workout.reps!;
        }

        // Check if repsMax is not null and less than the workout reps
        if (repsMax != null && workout.reps! > repsMax) {
          repsMax = workout.reps!;
        }

        // repsMin, repsMax is null, then assign it the default first value
        repsMin ??= workout.reps;
        repsMax ??= workout.reps;
      }

      // Weight
      if (workout.weight != null) {
        // Check if weightMin is not null and greater than the workout weight
        if (weightMin != null && workout.weight! < weightMin) {
          weightMin = workout.weight!;
        }

        // Check if weightMax is not null and less than the workout weight
        if (weightMax != null && workout.weight! > weightMax) {
          weightMax = workout.weight!;
        }

        // weightMin, weightMax is null, then assign it the default first value
        weightMin ??= workout.weight;
        weightMax ??= workout.weight;
      }

      // Time
      if (workout.time != null) {
        // Check if timeMin is not null and greater than the workout time
        if (timeMin != null && workout.time! < timeMin) {
          timeMin = workout.time!;
        }

        // Check if timeMax is not null and less than the workout time
        if (timeMax != null && workout.time! > timeMax) {
          timeMax = workout.time!;
        }

        // timeMin, timeMax is null, then assign it the default first value
        timeMin ??= workout.time;
        timeMax ??= workout.time;
      }

      // rest Time
      if (workout.restTime != null) {
        // Check if restTimeMin is not null and greater than the workout rest time
        if (restTimeMin != null && workout.restTime! < restTimeMin) {
          restTimeMin = workout.restTime!;
        }

        // Check if restTimeMax is not null and less than the workout restTime
        if (restTimeMax != null && workout.restTime! > restTimeMax) {
          restTimeMax = workout.restTime!;
        }

        // restTimeMin, restTimeMax is null, then assign it the default first value
        restTimeMin ??= workout.restTime;
        restTimeMax ??= workout.restTime;
      }
    }

    percent = completedWorkouts / (workouts.isEmpty ? 1 : workouts.length);

    if (repsMin != null && repsMax != null) {
      String reps;
      if (repsMin != repsMax) {
        reps = '$repsMin ~ $repsMax';
      } else {
        reps = '$repsMin';
      }

      details.addAll([
        Text(
          '$reps reps',
          style: context.theme.textTheme.bodyMedium,
        ),
        SizedBox(
          width: LayoutConstant.spaceBetweenWorkoutDetail,
        ),
      ]);
    }

    if (timeMin != null && timeMax != null) {
      String time;
      if (timeMin != timeMax) {
        time = '$timeMin ~ $timeMax';
      } else {
        time = '$timeMin';
      }

      details.addAll([
        Text(
          '$time sec(s)',
          style: context.theme.textTheme.bodyMedium,
        ),
        SizedBox(
          width: LayoutConstant.spaceBetweenWorkoutDetail,
        )
      ]);
    }

    if (weightMin != null && weightMax != null) {
      String weight;
      if (weightMin != weightMax) {
        weight = '$weightMin ~ $weightMax';
      } else {
        weight = '$weightMin';
      }

      details.addAll([
        Text(
          '$weight kg',
          style: context.theme.textTheme.bodyMedium,
        ),
        SizedBox(
          width: LayoutConstant.spaceBetweenWorkoutDetail,
        )
      ]);
    }

    if (restTimeMin != null && restTimeMax != null) {
      String restTime;
      if (restTimeMin != restTimeMax) {
        restTime = '$restTimeMin ~ $restTimeMax';
      } else {
        restTime = '$restTimeMin';
      }

      details.addAll([
        Text(
          '$restTime sec(s)',
          style: context.theme.textTheme.bodyMedium,
        ),
        SizedBox(
          width: LayoutConstant.spaceBetweenWorkoutDetail,
        )
      ]);
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
                      exercise.name,
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
            CircularPercentIndicator(
              radius: (LayoutConstant.workoutCardHeight -
                      32 * LayoutConstant.scaleFactor) /
                  2,
              lineWidth: 4 * LayoutConstant.scaleFactor,
              percent: percent,
              progressColor: context.theme.primaryColor,
              backgroundColor: context.theme.backgroundColor,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animationDuration: AppTheme.animationDuration.inSeconds,
              center: Center(
                child: Text(
                  '${(100 * percent).toInt()} %',
                  style: context.theme.textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
