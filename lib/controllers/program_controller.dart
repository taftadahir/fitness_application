import 'dart:convert';

import 'package:fitness_application/database/database_helper.dart';
import 'package:fitness_application/models/exercise.dart';
import 'package:fitness_application/models/model.dart';
import 'package:fitness_application/models/program.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_application/database/exercises.dart' as db;

class ProgramController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Used in Program screen, Program detail screen, result screen
  Program? _program;

  // used to show workouts for program on that day
  int? _activeDay = 15;

  // Tab controller
  late TabController tabController;

  // Contain program, exercises images for program detail screen and exercise
  List<dynamic>? images;

  // used to show image for the program in program detail screen
  int? _activeImageIndex = 0;

  // Workout
  Workout? workout;

  // Workout position
  int? workoutPosition;

  // Workouts length
  int? workoutsLength;

  // Exercise for exercise screen
  Future<Model?>? get exercise {
    final db = DatabaseHelper.instance;
    if (workout != null) {
      return db.readBySysId(
        table: Exercise.table,
        sysId: workout!.exerciseSysId,
        columnName: ExerciseDetail.sysId,
      );
    }
    return null;
  }

  // List of recommended programs
  List<Program> recommendedPrograms = List.generate(
    3,
    (index) => Program(
      sysId: 'sysId',
      name: 'Pull Up',
      level: ProgramLevel.medium,
      days: index * 10,
      status: ProgramStatus.completed,
    ),
  );

  // List of all programs
  List<Program> allPrograms = List.generate(
    30,
    (index) => Program(
      sysId: 'sysId',
      name: 'Pull Up',
      level: ProgramLevel.medium,
      days: index * 10,
      status: ProgramStatus.completed,
    ),
  );

  // List of exercises
  List<Exercise> exercises = db.exercises;

  // Program
  Program? get program => _program;
  set program(Program? program) {
    // TODO: Update the program
    _program = program;

    if (program != null) {
      // TODO: Update the list of images
      images = jsonDecode((program.images == null || program.images == '')
          ? "[]"
          : program.images!) as List<dynamic>;

      // TODO: Update the [_activeImageIndex]
      _activeImageIndex = 0;

      update();
    }
  }

  // List of workouts
  Future<List<Workout>?>? get workouts {
    final db = DatabaseHelper.instance;
    if (program != null) {
      return db.readAllWorkoutsForProgram(program!.sysId);
    }
    return null;
  }

  int get activeImageIndex => _activeImageIndex ?? -1;
  set activeImageIndex(int activeImageIndex) {
    _activeImageIndex = activeImageIndex;
    update();
  }

  // Active day
  int? get activeDay => _activeDay;
  set activeDay(int? day) {
    if (_activeDay != day) {
      _activeDay = day;
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    tabController.dispose();
    super.onClose();
  }
}
