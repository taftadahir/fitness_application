import 'package:fitness_application/constants/database_constant.dart';
import 'package:fitness_application/models/model.dart';

class Workout extends Model {
  // Database
  @override
  String get tableName => table;
  static String get table => 'workouts';

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

  @override
  Workout copy({
    int? id,
    String? sysId,
    String? exerciseSysId,
    String? programSysId,
    String? prevWorkoutSysId,
    WorkoutType? type,
    int? day,
    WorkoutStatus? status,
    int? reps,
    int? time,
    int? weight,
    int? restTime,
  }) =>
      Workout(
        id: id ?? this.id,
        sysId: sysId ?? this.sysId,
        exerciseSysId: exerciseSysId ?? this.exerciseSysId,
        type: type ?? this.type,
        programSysId: programSysId ?? this.programSysId,
        prevWorkoutSysId: prevWorkoutSysId ?? this.prevWorkoutSysId,
        day: day ?? this.day,
        reps: reps ?? this.reps,
        time: time ?? this.time,
        weight: weight ?? this.weight,
        restTime: restTime ?? this.restTime,
        status: status ?? this.status,
      );

  @override
  Map<String, Object?> toJson() {
    return {
      WorkoutDetail.id: id,
      WorkoutDetail.sysId: sysId,
      WorkoutDetail.programSysId: programSysId,
      WorkoutDetail.exerciseSysId: exerciseSysId,
      WorkoutDetail.prevWorkoutSysId: prevWorkoutSysId,
      WorkoutDetail.type: type.name,
      WorkoutDetail.status: status.name,
      WorkoutDetail.day: day,
      WorkoutDetail.reps: reps,
      WorkoutDetail.time: time,
      WorkoutDetail.weight: weight,
      WorkoutDetail.restTime: restTime,
    };
  }

  static Workout fromJson(
    Map<String, Object?> json,
  ) {
    return Workout(
      id: json[WorkoutDetail.id] as int?,
      sysId: json[WorkoutDetail.sysId] as String,
      exerciseSysId: json[WorkoutDetail.exerciseSysId] as String,
      programSysId: json[WorkoutDetail.programSysId] as String,
      type: WorkoutDetail.getType(json[WorkoutDetail.type] as String),
      prevWorkoutSysId: json[WorkoutDetail.prevWorkoutSysId] as String?,
      day: json[WorkoutDetail.day] as int,
      status: WorkoutDetail.getStatus(json[WorkoutDetail.status] as String),
      reps: json[WorkoutDetail.reps] as int?,
      time: json[WorkoutDetail.time] as int?,
      restTime: json[WorkoutDetail.restTime] as int?,
      weight: json[WorkoutDetail.weight] as int?,
    );
  }
}

enum WorkoutType {
  warmUp,
  workout,
  coolDown,
}

extension WorkoutTypeExtension on WorkoutType {
  String get name {
    switch (this) {
      case WorkoutType.coolDown:
        return DatabaseConstant.workouTypeCoolDown;
      case WorkoutType.warmUp:
        return DatabaseConstant.workouTypeWarmUp;
      default:
        return DatabaseConstant.workouTypeWorkout;
    }
  }
}

enum WorkoutStatus {
  notStarted,
  skipped,
  completed,
}

extension WorkoutStatusExtension on WorkoutStatus {
  String get name {
    switch (this) {
      case WorkoutStatus.completed:
        return DatabaseConstant.workoutStatusCompleted;
      case WorkoutStatus.notStarted:
        return DatabaseConstant.workoutStatusNotStarted;
      default:
        return DatabaseConstant.workoutStatusSkipped;
    }
  }
}

class WorkoutDetail {
  static final List<String> fields = [
    id,
    sysId,
    status,
    exerciseSysId,
    type,
    day,
    prevWorkoutSysId,
    programSysId,
    reps,
    time,
    weight,
    restTime,
  ];

  static const String id = '_id';
  static const String sysId = 'sys_id';
  static const String exerciseSysId = 'exercise_sys_id';
  static const String programSysId = 'program_sys_id';
  static const String prevWorkoutSysId = 'prev_workout_sys_id';
  static const String type = 'type';
  static const String day = 'w_day';
  static const String status = 'status';
  static const String reps = 'reps';
  static const String time = 'time';
  static const String weight = 'weight';
  static const String restTime = 'rest_time';

  static WorkoutStatus getStatus(String status) {
    if (status == DatabaseConstant.workoutStatusSkipped) {
      return WorkoutStatus.skipped;
    }
    if (status == DatabaseConstant.workoutStatusCompleted) {
      return WorkoutStatus.completed;
    }
    return WorkoutStatus.notStarted;
  }

  static WorkoutType getType(String type) {
    if (type == DatabaseConstant.workouTypeWarmUp) {
      return WorkoutType.warmUp;
    }

    if (type == DatabaseConstant.workouTypeCoolDown) {
      return WorkoutType.coolDown;
    }

    return WorkoutType.workout;
  }
}
