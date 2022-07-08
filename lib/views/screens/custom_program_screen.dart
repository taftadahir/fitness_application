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

class CustomProgramScreen extends StatelessWidget {
  const CustomProgramScreen({Key? key}) : super(key: key);

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
        onPressed: () {},
        label: const Text('Start'),
      ),
      body: GetBuilder<ProgramController>(
        builder: (controller) => controller.customProgram == null
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
                        controller.customProgram!.name,
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
                        plusButton(context, () {}),
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
                                () {},
                              ),
                            ],
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
                                () {},
                              ),
                            ],
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
                                () {},
                              ),
                            ],
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
