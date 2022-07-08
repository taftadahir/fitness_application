import 'package:fitness_application/constants/database_constant.dart';
import 'package:fitness_application/models/model.dart';

class Program extends Model {
  // Database
  @override
  String get tableName => table;
  static String get table => 'programs';

  // Modifiable through program lifecycle
  int? id;
  int days;
  String? images;
  String? details;
  ProgramStatus status;
  int lastCompletedDay;

  // Not modifiable anymore after creation
  final String sysId;
  final String name;
  final ProgramLevel level;

  Program({
    this.id,
    required this.sysId,
    required this.name,
    required this.level,
    required this.days,
    required this.status,
    this.images,
    this.details,
    this.lastCompletedDay = 0,
  });

  @override
  Program copy({
    int? id,
    String? sysId,
    String? name,
    ProgramLevel? level,
    ProgramStatus? status,
    int? days,
    String? images,
    String? details,
    int? lastCompletedDay,
  }) =>
      Program(
        id: id ?? this.id,
        sysId: sysId ?? this.sysId,
        name: name ?? this.name,
        level: level ?? this.level,
        days: days ?? this.days,
        status: status ?? this.status,
        images: images ?? this.images,
        details: details ?? this.details,
        lastCompletedDay: lastCompletedDay ?? this.lastCompletedDay,
      );

  @override
  Map<String, Object?> toJson() => {
        ProgramDetail.id: id,
        ProgramDetail.sysId: sysId,
        ProgramDetail.name: name,
        ProgramDetail.images: images,
        ProgramDetail.details: details,
        ProgramDetail.days: days,
        ProgramDetail.level: level.name,
        ProgramDetail.status: status.name,
        ProgramDetail.lastCompletedDay: lastCompletedDay,
      };

  static Program fromJson(Map<String, Object?> json) => Program(
        id: json[ProgramDetail.id] as int?,
        sysId: json[ProgramDetail.sysId] as String,
        name: json[ProgramDetail.name] as String,
        details: json[ProgramDetail.details] as String?,
        images: json[ProgramDetail.images] as String?,
        days: json[ProgramDetail.days] as int,
        level: ProgramDetail.getLevel(json[ProgramDetail.level] as String),
        status: ProgramDetail.getStatus(json[ProgramDetail.status] as String),
        lastCompletedDay: json[ProgramDetail.lastCompletedDay] as int,
      );
}

// Level
enum ProgramLevel {
  starter,
  medium,
  advanced,
}

extension ProgramLevelExtension on ProgramLevel {
  String get name {
    switch (this) {
      case ProgramLevel.starter:
        return DatabaseConstant.programLevelStarter;
      case ProgramLevel.medium:
        return DatabaseConstant.programLevelMedium;
      default:
        return DatabaseConstant.programLevelAdvanced;
    }
  }
}

// Status
enum ProgramStatus {
  notStarted,
  inProgress,
  completed,
}

extension ProgramStatusExtension on ProgramStatus {
  String get name {
    switch (this) {
      case ProgramStatus.notStarted:
        return 'Not started';
      case ProgramStatus.inProgress:
        return 'In progress';
      default:
        return 'Completed';
    }
  }
}

// Detail
class ProgramDetail {
  static final List<String> fields = [
    id,
    sysId,
    name,
    images,
    details,
    days,
    status,
    level,
    lastCompletedDay,
  ];

  static const String id = '_id';
  static const String sysId = 'sys_id';
  static const String name = 'name';
  static const String images = 'images';
  static const String details = 'details';
  static const String status = 'status';
  static const String level = 'level';
  static const String days = 'days';
  static const String lastCompletedDay = 'last_completed_day';

  static ProgramStatus getStatus(String status) {
    if (status == DatabaseConstant.programStatusInProgress) {
      return ProgramStatus.inProgress;
    }
    if (status == DatabaseConstant.programStatusCompleted) {
      return ProgramStatus.completed;
    }
    return ProgramStatus.notStarted;
  }

  static ProgramLevel getLevel(String level) {
    if (status == DatabaseConstant.programLevelAdvanced) {
      return ProgramLevel.advanced;
    }
    if (status == DatabaseConstant.programLevelMedium) {
      return ProgramLevel.medium;
    }
    return ProgramLevel.starter;
  }
}
