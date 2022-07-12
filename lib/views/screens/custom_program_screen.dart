import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/controllers/timer_controller.dart';
import 'package:fitness_application/database/database_helper.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:fitness_application/services/storage_service.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/day_component.dart';
import 'package:fitness_application/views/components/snack_bar_component.dart';
import 'package:fitness_application/views/components/workout_card_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgramScreen extends StatelessWidget {
  const CustomProgramScreen({Key? key}) : super(key: key);

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
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.autorenew_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(EvaIcons.shuffle2Outline),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
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

          ProgramController programController = Get.find();

          // Update workout position
          programController.workoutPosition = 0;

          // TODO: Get and update the next workout
          List<Workout>? workouts = (await programController.workouts)
              ?.where((workout) => workout.day == programController.activeDay)
              .toList();
          programController.workout = workouts
              ?.firstWhereOrNull((workout) => workout.prevWorkoutSysId == null);

          // Update workouts length
          programController.workoutsLength =
              workouts != null ? workouts.length : 0;

          // TODO: Go Rest screen
          if (programController.workout != null &&
              programController.workoutPosition != null) {
            Get.toNamed(RouteConstant.restScreen);
          } else {
            // TODO: Show a snackbar meaning we don't have a next workout to show a rest time time before it.
            SnackBarComponent.snackbar(
              context,
              title: 'title',
              message: 'No next workout',
            );
          }
        },
        label: const Text('Start'),
      ),
      body: GetBuilder<ProgramController>(
        builder: (controller) => controller.program == null
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: LayoutConstant.screenPadding,
                  vertical: LayoutConstant.screenPadding,
                ),
                child: Text(
                  'No custom program',
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
                        controller.program!.name,
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
                      children: [
                        ...List.generate(
                          controller.program!.days,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8 * LayoutConstant.scaleFactor,
                            ),
                            child: DayComponent(
                              key: index + 1 == controller.activeDay
                                  ? dayKey
                                  : null,
                              day: index + 1,
                              active: index + 1 == controller.activeDay,
                              completed: index + 1 <=
                                  controller.program!.lastCompletedDay,
                            ),
                          ),
                        ),
                        plusButton(
                          context,
                          () {
                            // TODO: Add day
                            controller.program!.days += 1;
                            var db = DatabaseHelper.instance;
                            db
                                .updateData(controller.program!,
                                    controller.program!.id!)
                                .then((value) => controller.update());
                          },
                        ),
                      ],
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Warm Up',
                                style: context.theme.textTheme.titleMedium,
                              ),
                              plusButton(
                                context,
                                () {
                                  // TODO: Need to specify what type of workout we want to create
                                  Get.toNamed(RouteConstant.addWorkoutScreen);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),

                          // List of workouts for Warm Up
                          FutureBuilder(
                            future: controller.workouts,
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
                                                      controller.activeDay)
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Workouts',
                                style: context.theme.textTheme.titleMedium,
                              ),
                              plusButton(
                                context,
                                () {
                                  // TODO: Need to specify what type of workout we want to create
                                  Get.toNamed(RouteConstant.addWorkoutScreen);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),

                          // List of workouts for Workout
                          FutureBuilder(
                            future: controller.workouts,
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
                                                      controller.activeDay)
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Cool down',
                                style: context.theme.textTheme.titleMedium,
                              ),
                              plusButton(
                                context,
                                () {
                                  // TODO: Need to specify what type of workout we want to create
                                  Get.toNamed(RouteConstant.addWorkoutScreen);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),

                          // List of workouts for Workout
                          FutureBuilder(
                            future: controller.workouts,
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
                                                      controller.activeDay)
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

  Widget plusButton(
    BuildContext context,
    void Function()? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppTheme.animationDuration,
        height: LayoutConstant.daySize,
        width: LayoutConstant.daySize,
        padding: EdgeInsets.all(4 * LayoutConstant.scaleFactor),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.theme.cardColor,
            width: LayoutConstant.scaleFactor,
          ),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: FittedBox(
            child: Icon(EvaIcons.plus),
          ),
        ),
      ),
    );
  }
}
