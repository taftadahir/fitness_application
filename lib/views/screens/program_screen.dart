import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/controllers/timer_controller.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:fitness_application/services/storage_service.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/day_component.dart';
import 'package:fitness_application/views/components/workout_card_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scroll to active day on
    final dayKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final context = dayKey.currentContext;
        if (context != null) {
          await Scrollable.ensureVisible(
            context,
            alignment: 0.5,
          );
        }
      },
    );

    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.arrowBackOutline),
          onPressed: () {
            // Go back to Home screen by removing the actual screen
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.autorenew_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(EvaIcons.infoOutline),
            onPressed: () {
              Get.toNamed(RouteConstant.programDetailScreen);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Get Countdown
          int? countDown = StorageService.countDown;
          TimerController timerController = Get.find();
          if (countDown != null && countDown > 0) {
            // TODO: Initialize the timer with this count down
            timerController.count = countDown;
            timerController.initialCount = countDown;

            // This is used to run the timer
            timerController.isTimer = true;
            timerController.startTimer();
          } else {
            timerController.isTimer = false;
          }

          // TODO: Get and update the next workout

          // TODO: Go Rest screen
          Get.toNamed(RouteConstant.restScreen);
        },
        label: const Text('Start'),
      ),
      body: GetBuilder<ProgramController>(
        builder: (programController) => programController.program == null
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: LayoutConstant.screenPadding,
                  vertical: LayoutConstant.screenPadding,
                ),
                child: Text(
                  'No program',
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.titleLarge,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 32 * LayoutConstant.scaleFactor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.screenPadding,
                    ),
                    child: Center(
                      child: Text(
                        programController.program!.name,
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16 * LayoutConstant.scaleFactor,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: AppTheme.scrollPhysic,
                    child: Row(
                      children: List.generate(
                        programController.program!.days,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8 * LayoutConstant.scaleFactor,
                          ),
                          child: DayComponent(
                            key: index + 1 == programController.activeDay
                                ? dayKey
                                : null,
                            day: index + 1,
                            active: index + 1 == programController.activeDay,
                            completed: index + 1 <=
                                programController.program!.lastCompletedDay,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32 * LayoutConstant.scaleFactor,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AppTheme.scrollPhysic,
                      padding: EdgeInsets.symmetric(
                        horizontal: LayoutConstant.screenPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Warm Up',
                            style: context.theme.textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),

                          // List of workouts for Warm Up
                          FutureBuilder(
                            future: programController.workouts,
                            builder: (context, snapshot) {
                              return snapshot.connectionState ==
                                      ConnectionState.done
                                  ? ((snapshot.hasData &&
                                          (snapshot.data as List<Workout>)
                                              .isNotEmpty)
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: (snapshot.data
                                                  as List<Workout>)
                                              .where((workout) =>
                                                  workout.type ==
                                                      WorkoutType.warmUp &&
                                                  workout.day ==
                                                      programController
                                                          .activeDay)
                                              .map(
                                                (workout) => Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 8 *
                                                        LayoutConstant
                                                            .scaleFactor,
                                                  ),
                                                  child: WorkoutCardComponent(
                                                      workout: workout),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        ))
                                  : const SizedBox(
                                      height: 0,
                                    );
                            },
                          ),

                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),
                          Text(
                            'Workouts',
                            style: context.theme.textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),

                          // List of workouts for Warm Up
                          FutureBuilder(
                            future: programController.workouts,
                            builder: (context, snapshot) {
                              return snapshot.connectionState ==
                                      ConnectionState.done
                                  ? ((snapshot.hasData &&
                                          (snapshot.data as List<Workout>)
                                              .isNotEmpty)
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: (snapshot.data
                                                  as List<Workout>)
                                              .where((workout) =>
                                                  workout.type ==
                                                      WorkoutType.workout &&
                                                  workout.day ==
                                                      programController
                                                          .activeDay)
                                              .map(
                                                (workout) => Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 8 *
                                                        LayoutConstant
                                                            .scaleFactor,
                                                  ),
                                                  child: WorkoutCardComponent(
                                                      workout: workout),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        ))
                                  : const SizedBox(
                                      height: 0,
                                    );
                            },
                          ),

                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),
                          Text(
                            'Cool down',
                            style: context.theme.textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),

                          // List of workouts for Warm Up
                          FutureBuilder(
                            future: programController.workouts,
                            builder: (context, snapshot) {
                              return snapshot.connectionState ==
                                      ConnectionState.done
                                  ? ((snapshot.hasData &&
                                          (snapshot.data as List<Workout>)
                                              .isNotEmpty)
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: (snapshot.data
                                                  as List<Workout>)
                                              .where((workout) =>
                                                  workout.type ==
                                                      WorkoutType.coolDown &&
                                                  workout.day ==
                                                      programController
                                                          .activeDay)
                                              .map(
                                                (workout) => Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 8 *
                                                        LayoutConstant
                                                            .scaleFactor,
                                                  ),
                                                  child: WorkoutCardComponent(
                                                      workout: workout),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        ))
                                  : const SizedBox(
                                      height: 0,
                                    );
                            },
                          ),

                          SizedBox(
                            height: 48 * LayoutConstant.scaleFactor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
