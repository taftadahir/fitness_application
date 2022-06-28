class Workout {
  // Modifiable through workout lifecycle
  int? id;
  String? prevWorkoutSysId;
  int? reps;
  int? time;
  int? weight;
  int? restTime;
  WorkoutStatus status;

  // Not modifiable anymore after creation
  final String sysId;
  final String programSysId;
  final String exerciseSysId;
  final WorkoutType type;
  final int day;

  Workout({
    this.id,
    required this.sysId,
    required this.programSysId,
    required this.exerciseSysId,
    required this.day,
    this.prevWorkoutSysId,
    this.reps,
    this.time,
    this.weight,
    this.restTime,
    this.type = WorkoutType.workout,
    this.status = WorkoutStatus.notStarted,
  });
}

enum WorkoutType {
  warmUp,
  workout,
  coolDown,
}

enum WorkoutStatus {
  notStarted,
  skipped,
  completed,
  reorder,
}
