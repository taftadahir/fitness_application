import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/controllers/timer_controller.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/button_component.dart';
import 'package:fitness_application/views/components/pop_up_component.dart';
import 'package:fitness_application/views/components/timer_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestScreen extends StatelessWidget {
  const RestScreen({Key? key}) : super(key: key);

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
      ),
      body: SingleChildScrollView(
        physics: AppTheme.scrollPhysic,
        child: Container(
          constraints: BoxConstraints(
            minHeight: Get.height - LayoutConstant.appbarHeight,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: LayoutConstant.screenPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Next workout
              GetBuilder<ProgramController>(builder: (programController) {
                return FutureBuilder(
                  future: programController.workouts,
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.done
                        ? ((snapshot.hasData &&
                                (snapshot.data as List<Workout>).isNotEmpty &&
                                programController.workoutPosition != null)
                            ? Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 32 * LayoutConstant.scaleFactor,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          (snapshot.data as List<Workout>)[
                                                  programController
                                                      .workoutPosition!]
                                              .exerciseSysId,
                                          maxLines: 2,
                                          textAlign: TextAlign.right,
                                          style: context
                                              .theme.textTheme.titleLarge,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8 * LayoutConstant.scaleFactor,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.toNamed(
                                              RouteConstant.exerciseScreen);
                                        },
                                        icon: const Icon(
                                          Icons.help_outline_rounded,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8 * LayoutConstant.scaleFactor,
                                  ),
                                  Text(
                                    "Next workout ( ${programController.workoutPosition! + 1} / ${(snapshot.data as List<Workout>).length} )",
                                    textAlign: TextAlign.center,
                                    style: context.theme.textTheme.bodyLarge,
                                  ),
                                ],
                              )
                            : const SizedBox(
                                height: 0,
                              ))
                        : const SizedBox(
                            height: 0,
                          );
                  },
                );
              }),

              // Timer and reps
              GetBuilder<TimerController>(
                builder: (controller) => TimerComponent(
                  count: controller.count,
                  initialCount: controller.initialCount,
                  description: 'Take a rest',
                ),
              ),

              // Buttons
              Column(
                children: [
                  ButtonComponent(
                    onPressed: () {
                      TimerController timerController = Get.find();
                      timerController.count += 30;
                      timerController.initialCount += 30;
                      timerController.isTimer = true;
                      timerController.startTimer();
                    },
                    text: '+ 30 sec',
                    isPrimary: false,
                  ),
                  SizedBox(
                    height: 8 * LayoutConstant.scaleFactor,
                  ),
                  GetBuilder<TimerController>(builder: (timerController) {
                    return ButtonComponent(
                      onPressed: () {
                        // TODO: Should close the timer
                        timerController.cancelTimer();
                        Get.toNamed(RouteConstant.workoutOnScreen);
                      },
                      // TODO: The text should change from [Skip] to [Continue] depending on timer count value.
                      // if count <= 0, text = [Continue], else [Skip]
                      text: timerController.count <= 0 ? 'Continue' : 'Skip',
                    );
                  }),
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
