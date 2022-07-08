import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/models/workout.dart';
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
        final context = dayKey.currentContext!;
        await Scrollable.ensureVisible(
          context,
          alignment: 0.5,
        );
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
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Start'),
      ),
      body: GetBuilder<ProgramController>(
        builder: (controller) => controller.program == null
            ? Text(
                'No program',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleLarge,
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
                        "CORE + ABS",
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
                          30,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8 * LayoutConstant.scaleFactor,
                            ),
                            child: DayComponent(
                              key:
                                  index == controller.activeDay ? dayKey : null,
                              day: index,
                              active: index == controller.activeDay,
                              completed: index <= controller.activeDay!,
                            ),
                          ),
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
                          Text(
                            'Warm Up',
                            style: context.theme.textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 16 * LayoutConstant.scaleFactor,
                          ),
                          ...controller.workouts
                              .where((workout) =>
                                  workout.type == WorkoutType.warmUp &&
                                  workout.day == controller.activeDay)
                              .map(
                                (workout) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 8 * LayoutConstant.scaleFactor,
                                  ),
                                  child: WorkoutCardComponent(workout: workout),
                                ),
                              )
                              .toList(),
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
                          ...controller.workouts
                              .where((workout) =>
                                  workout.type == WorkoutType.workout &&
                                  workout.day == controller.activeDay)
                              .map(
                                (workout) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 8 * LayoutConstant.scaleFactor,
                                  ),
                                  child: WorkoutCardComponent(workout: workout),
                                ),
                              )
                              .toList(),
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
                          ...controller.workouts
                              .where((workout) =>
                                  workout.type == WorkoutType.coolDown &&
                                  workout.day == controller.activeDay)
                              .map(
                                (workout) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 8 * LayoutConstant.scaleFactor,
                                  ),
                                  child: WorkoutCardComponent(workout: workout),
                                ),
                              )
                              .toList(),
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
