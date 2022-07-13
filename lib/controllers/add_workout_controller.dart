import 'package:fitness_application/controllers/home_controller.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/database/database_helper.dart';
import 'package:fitness_application/database/exercises.dart' as db;
import 'package:fitness_application/models/exercise.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWorkoutController extends GetxController {
  late TextEditingController repsController,
      weigthController,
      restController,
      timeController;
  String? reps, rest, weight, time, sysId;
  Exercise? _exercise;
  WorkoutType? type;
  final GlobalKey<FormState> addWorkoutFormKey = GlobalKey<FormState>();

  // List of exercises
  List<Exercise> exercises = db.exercises;

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
    timeController = TextEditingController();
  }

  void save() async {
    addWorkoutFormKey.currentState!.save();
    // TODO: Validate values

    if (sysId != null) {
      // Update workout

    } else {
      // Generate a sysid for the new workout
      sysId = 'WRK20000';

      HomeController homeController = Get.find();
      ProgramController programController = Get.find();

      // Insert the new workout
      Workout workout = Workout(
        sysId: sysId!,
        programSysId: homeController.customProgramSysId,
        exerciseSysId: exercise!.sysId,
        day: programController.activeDay!,
        type: type!,
        reps: isNumeric(reps) ? double.parse(reps!).toInt() : null,
        weight: isNumeric(weight) ? double.parse(weight!).toInt() : null,
        time: isNumeric(time) ? double.parse(time!).toInt() : null,
        restTime: isNumeric(rest) ? double.parse(rest!).toInt() : null,
      );

      final db = DatabaseHelper.instance;
      await db.insertData(workout);

      reps = null;
      weight = null;
      time = null;
      rest = null;
      sysId = null;
      _exercise = null;

      repsController.clear();
      weigthController.clear();
      restController.clear();
      timeController.clear();
    }
    ProgramController programController = Get.find();
    programController.update();
    Get.back();
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
