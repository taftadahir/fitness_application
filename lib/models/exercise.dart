import 'package:fitness_application/models/model.dart';

class Exercise extends Model {
  // Database
  @override
  String get tableName => table;
  static String get table => 'exercises';

  // Modifiable through exercise lifecycle
  int? id;

  // Not modifiable anymore after creation
  final String sysId;
  final String name;
  final String? images;
  final String? details;

  Exercise({
    this.id,
    required this.sysId,
    required this.name,
    this.images,
    this.details,
  });

  @override
  Exercise copy({
    int? id,
    String? sysId,
    String? name,
    String? images,
    String? details,
  }) =>
      Exercise(
        id: id ?? this.id,
        sysId: sysId ?? this.sysId,
        name: name ?? this.name,
        details: details ?? this.details,
        images: images ?? this.images,
      );

  @override
  Map<String, Object?> toJson() => {
        ExerciseDetail.id: id,
        ExerciseDetail.sysId: sysId,
        ExerciseDetail.name: name,
        ExerciseDetail.images: images,
        ExerciseDetail.details: details,
      };

  static Exercise fromJson(Map<String, Object?> json) => Exercise(
        id: json[ExerciseDetail.id] as int?,
        sysId: json[ExerciseDetail.sysId] as String,
        name: json[ExerciseDetail.name] as String,
        details: json[ExerciseDetail.details] as String?,
        images: json[ExerciseDetail.images] as String?,
      );
}

class ExerciseDetail {
  static final List<String> fields = [
    id,
    sysId,
    name,
    images,
    details,
  ];

  static const String id = '_id';
  static const String sysId = 'sys_id';
  static const String name = 'name';
  static const String images = 'images';
  static const String details = 'details';
}
