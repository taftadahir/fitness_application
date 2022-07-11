import 'dart:convert';

import 'package:fitness_application/database/database_helper.dart';
import 'package:fitness_application/models/exercise.dart';
import 'package:fitness_application/models/program.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  Exercise? exercise = Exercise(
      sysId: 'sysId',
      name: 'Push Up',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. ');

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
  List<Exercise> exercises = List.generate(
    12,
    (index) => Exercise(
      sysId: 'EX$index',
      name: 'Push Up$index',
      images:
          '["front_lever.png", "front_lever.png", "front_lever.png", "front_lever.png"]',
    ),
  );

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
