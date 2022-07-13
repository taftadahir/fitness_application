import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fitness_application/configs/app_theme.dart';
import 'package:fitness_application/constants/layout_constant.dart';
import 'package:fitness_application/controllers/add_workout_controller.dart';
import 'package:fitness_application/database/exercises.dart';
import 'package:fitness_application/views/components/appbar_component.dart';
import 'package:fitness_application/views/components/exercise_card_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWorkoutChooseExerciseScreen extends StatelessWidget {
  const AddWorkoutChooseExerciseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        leading: IconButton(
          icon: const Icon(EvaIcons.arrowBackOutline),
          onPressed: () {
            // TODO: GO BACK
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.searchOutline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(EvaIcons.options2Outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24 * LayoutConstant.scaleFactor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: LayoutConstant.screenPadding,
            ),
            child: Text(
              "Choose exercise",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 16 * LayoutConstant.scaleFactor,
          ),
          Expanded(
            child: GridView.builder(
              physics: AppTheme.scrollPhysic,
              padding: EdgeInsets.only(
                left: LayoutConstant.screenPadding,
                right: LayoutConstant.screenPadding,
                bottom: LayoutConstant.screenPadding,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: LayoutConstant.screenPadding,
                mainAxisSpacing: LayoutConstant.screenPadding,
              ),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return ExerciseCardComponent(
                  exercise: exercises[index],
                  onTap: () {
                    AddWorkoutController workoutController = Get.find();
                    workoutController.exercise = exercises[index];
                    Get.back();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
