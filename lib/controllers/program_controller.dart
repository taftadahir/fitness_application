import 'dart:math';

import 'package:fitness_application/models/exercise.dart';
import 'package:fitness_application/models/program.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  // Used in Program screen, Program detail screen, result screen
  Program? _program = Program(
    sysId: 'sysId',
    name: "CORE + ABS",
    level: ProgramLevel.medium,
    days: 30,
    status: ProgramStatus.completed,
    details:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna. ',
  );

  // used to show workouts for program on that day
  int? _activeDay = 15;

  // Contain program, exercises images for program detail screen and exercise
  List<dynamic>? images = ['front_lever.png', 'front_lever.png'];

  // used to show image for the program in program detail screen
  int? _activeImageIndex = 0;

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

  // All list of workouts for the program
  List<Workout> workouts = List.generate(
    10,
    (index) => Workout(
        sysId: 'SysID$index',
        programSysId: 'programSysId',
        exerciseSysId: 'exerciseSysId',
        reps: 10 * index,
        weight: 5 * index,
        restTime: 300,
        status: WorkoutStatus.skipped,
        type: index < 3
            ? WorkoutType.warmUp
            : (index > 7 ? WorkoutType.coolDown : WorkoutType.workout),
        day: 15),
  );

  // Program
  Program? get program => _program;
  set program(Program? program) {
    // TODO: Update the program
    _program = program;
    if (program != null) {
      update();
    }
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
}
