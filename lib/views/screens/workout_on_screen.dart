import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/controllers/timer_controller.dart';
import 'package:fitness_application/database/database_helper.dart';
import 'package:fitness_application/models/exercise.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/button_component.dart';
import 'package:fitness_application/views/components/pop_up_component.dart';
import 'package:fitness_application/views/components/timer_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutOnScreen extends StatelessWidget {
  const WorkoutOnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.close),
          onPressed: () {
            // TODO: Should show a popup in order to close the screen
            PopUpComponent.dialog(
              context,
              title: 'title',
              message: 'message',
              cancelText: 'Cancel',
              onPressedCancel: () {
                Get.back();
              },
              validateText: 'Quit',
              onPressedValidate: () {
                // TODO: Reset timer
                TimerController timerController = Get.find();
                timerController.cancelTimer();

                // Go back
                Get.back();
                Get.back();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.autorenew_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(EvaIcons.arrowheadRightOutline),
            onPressed: () async {
              //TODO: Skipped
              final db = DatabaseHelper.instance;
              // Update workout
              ProgramController programController = Get.find();
              programController.workout?.status = WorkoutStatus.skipped;
              await db.updateData(
                  programController.workout!, programController.workout!.id!);

              Workout? workout = await db.readBySysId(
                table: Workout.table,
                sysId: programController.workout != null
                    ? programController.workout!.sysId
                    : '',
                columnName: WorkoutDetail.prevWorkoutSysId,
              ) as Workout?;

              TimerController timerController = Get.find();
              // TODO: Initialize the timer with this count down
              timerController.count =
                  programController.workout!.restTime != null
                      ? programController.workout!.restTime!
                      : 0;
              timerController.initialCount =
                  programController.workout!.restTime != null
                      ? programController.workout!.restTime!
                      : 0;

              if (workout != null) {
                programController.workout = workout;
                programController.workoutPosition =
                    programController.workoutPosition != null
                        ? programController.workoutPosition! + 1
                        : programController.workoutPosition;

                // This is used to run the timer
                timerController.isTimer =
                    programController.workout!.restTime != null;
                timerController.startTimer();

                Get.offNamed(RouteConstant.restScreen);
              } else {
                timerController.isTimer = false;

                // TODO: Update the last completed day for that program
                programController.program?.lastCompletedDay =
                    programController.activeDay!;
                await db.updateData(
                    programController.program!, programController.program!.id!);
                programController.update();

                // TODO: Go to Result screen
                Get.offNamed(RouteConstant.resultScreen);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AppTheme.scrollPhysic,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: Get.height - LayoutConstant.appbarHeight,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: LayoutConstant.screenPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 16 * LayoutConstant.scaleFactor,
              ),

              // Add Image
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/front_lever.png',
                  ),
                ),
              ),
              SizedBox(
                height: 24 * LayoutConstant.scaleFactor,
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Add Title and help
                  GetBuilder<ProgramController>(builder: (programController) {
                    return FutureBuilder(
                        future: programController.exercise,
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: snapshot.connectionState ==
                                            ConnectionState.done &&
                                        snapshot.hasData
                                    ? Text(
                                        (snapshot.data as Exercise).name,
                                        maxLines: 2,
                                        textAlign: TextAlign.right,
                                        style:
                                            context.theme.textTheme.titleLarge,
                                      )
                                    : Text(
                                        'Unknown exercise',
                                        maxLines: 2,
                                        textAlign: TextAlign.right,
                                        style:
                                            context.theme.textTheme.titleLarge,
                                      ),
                              ),
                              SizedBox(
                                width: 8 * LayoutConstant.scaleFactor,
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(RouteConstant.exerciseScreen);
                                },
                                icon: const Icon(
                                  Icons.help_outline_rounded,
                                ),
                              ),
                            ],
                          );
                        });
                  }),
                  SizedBox(
                    height: 24 * LayoutConstant.scaleFactor,
                  ),

                  // Add timer
                  GetBuilder<TimerController>(
                    builder: (controller) => TimerComponent(
                      count: controller.count,
                      initialCount: controller.initialCount,
                      description:
                          controller.isTimer != null && controller.isTimer!
                              ? 'Seconds left'
                              : 'Reps to do',
                    ),
                  ),
                  SizedBox(
                    height: 24 * LayoutConstant.scaleFactor,
                  ),

                  // Add buttons
                  ButtonComponent(
                    onPressed: () async {
                      ProgramController programController = Get.find();
                      final db = DatabaseHelper.instance;
                      Workout? workout = await db.readBySysId(
                        table: Workout.table,
                        sysId: programController.workout != null
                            ? programController.workout!.sysId
                            : '',
                        columnName: WorkoutDetail.prevWorkoutSysId,
                      ) as Workout?;

                      TimerController timerController = Get.find();
                      // TODO: Initialize the timer with this count down
                      timerController.count =
                          programController.workout!.restTime != null
                              ? programController.workout!.restTime!
                              : 0;
                      timerController.initialCount =
                          programController.workout!.restTime != null
                              ? programController.workout!.restTime!
                              : 0;

                      // Update workout
                      programController.workout?.status =
                          WorkoutStatus.completed;
                      await db.updateData(programController.workout!,
                          programController.workout!.id!);

                      if (workout != null) {
                        programController.workout = workout;
                        programController.workoutPosition =
                            programController.workoutPosition != null
                                ? programController.workoutPosition! + 1
                                : programController.workoutPosition;

                        // This is used to run the timer
                        timerController.isTimer =
                            programController.workout!.restTime != null;
                        timerController.startTimer();

                        Get.offNamed(RouteConstant.restScreen);
                      } else {
                        timerController.isTimer = false;

                        // TODO: Go to Result screen
                        Get.offNamed(RouteConstant.resultScreen);
                      }
                    },
                    text: 'Done',
                  ),
                  SizedBox(
                    height: 16 * LayoutConstant.scaleFactor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
