import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/result_component.dart';
import 'package:fitness_application/views/components/workout_card_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.homeOutline),
          onPressed: () {
            Get.offAllNamed(RouteConstant.homeScreen);
          },
        ),
      ),
      body: GetBuilder<ProgramController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32 * LayoutConstant.scaleFactor,
            ),
            FutureBuilder(
                future: controller.workouts,
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData
                      ? ResultComponent(
                          workouts: snapshot.data as List<Workout>)
                      : Text(
                          'In Progress...',
                          style: context.theme.textTheme.bodyMedium,
                        );
                }),
            SizedBox(
              height: 32 * LayoutConstant.scaleFactor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: LayoutConstant.screenPadding,
              ),
              child: Row(
                children: [
                  Text(
                    'Workouts',
                    style: context.theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16 * LayoutConstant.scaleFactor,
            ),
            Expanded(
              child: ListView(
                physics: AppTheme.scrollPhysic,
                padding: EdgeInsets.symmetric(
                  horizontal: LayoutConstant.screenPadding,
                ),
                children: [
                  FutureBuilder(
                    future: controller.workouts,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: (snapshot.data as List<Workout>)
                              .toList()
                              .map(
                                (workout) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 8 * LayoutConstant.scaleFactor,
                                  ),
                                  child: WorkoutCardComponent(workout: workout),
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return Text(
                          'In Progress...',
                          style: context.theme.textTheme.bodyMedium,
                        );
                      }
                    },
                  ),
                  // ...controller.workouts
                  //     .where((workout) => workout.day == controller.activeDay)
                  //     .map(
                  //       (workout) => Padding(
                  //         padding: EdgeInsets.only(
                  //           bottom: 8 * LayoutConstant.scaleFactor,
                  //         ),
                  //         child: WorkoutCardComponent(workout: workout),
                  //       ),
                  //     )
                  //     .toList(),
                  SizedBox(
                    height: 16 * LayoutConstant.scaleFactor,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
