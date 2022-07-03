import 'package:fitness_application/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWorkoutController extends GetxController {
  late TextEditingController repsController, weigthController, restController;
  String? reps, rest, weight, sysId;
  Exercise? _exercise = Exercise(sysId: 'sysId', name: 'name');
  final GlobalKey<FormState> addWorkoutFormKey = GlobalKey<FormState>();

  // Exercise
  Exercise? get exercise => _exercise;
  set exercise(Exercise? exercise) {
    // TODO: Update exercise
    if (exercise != null) {
      _exercise = exercise;
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    repsController = TextEditingController();
    weigthController = TextEditingController();
    restController = TextEditingController();
  }

  void register() {
    addWorkoutFormKey.currentState!.save();
    // TODO: Validate values

    if (sysId != null) {
      // Update workout

    } else {
      // Generate a sysid for the new workout

      // Insert the new workout
    }
  }
}
