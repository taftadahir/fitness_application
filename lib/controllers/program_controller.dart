import 'package:fitness_application/models/program.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  // Used in Program screen, Program detail screen, result screen
  Program? _program;

  // used to show workouts for program on that day
  int? _activeDay = 15;

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

  // Active day
  int? get activeDay => _activeDay;
  set activeDay(int? day) {
    if (_activeDay != day) {
      _activeDay = day;
      update();
    }
  }
}
