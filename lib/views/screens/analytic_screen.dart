import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/result_component.dart';
import 'package:fitness_application/views/components/statistic_card_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:collection/collection.dart";

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.arrowBackOutline),
          onPressed: () {
            Get.back();
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
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.done &&
                            (snapshot.hasData &&
                                (snapshot.data as List<Workout>).isNotEmpty)
                        ? ResultComponent(
                            workouts: (snapshot.data as List<Workout>))
                        : const SizedBox(
                            height: 0,
                          )),
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
                    'All workouts',
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
                  ...controller.exercises
                      .groupListsBy((element) => element.sysId)
                      .values
                      .map(
                        (exercises) => Padding(
                          padding: EdgeInsets.only(
                            bottom: 8 * LayoutConstant.scaleFactor,
                          ),
                          // child: StatisticCardComponent(
                          //   exercise: exercises[0],
                          //   workouts: controller.workouts
                          //       .where((workout) =>
                          //           workout.exerciseSysId == exercises[0].sysId)
                          //       .toList(),
                          // ),
                        ),
                      )
                      .toList(),
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
