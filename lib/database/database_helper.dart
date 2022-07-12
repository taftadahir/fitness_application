import 'dart:async';
import 'package:fitness_application/constants/database_constant.dart';
import 'package:fitness_application/database/exercises.dart';
import 'package:fitness_application/database/programs.dart';
import 'package:fitness_application/database/workouts.dart';
import 'package:fitness_application/models/exercise.dart';
import 'package:fitness_application/models/model.dart';
import 'package:fitness_application/models/program.dart';
import 'package:fitness_application/models/workout.dart';
import 'package:fitness_application/services/storage_service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  // Database getter
  Future<Database> get database async {
    _database ??= await _initializeDatabase(DatabaseConstant.name);
    return _database!;
  }

  // Initialize database
  Future<Database> _initializeDatabase(String dbFileName) async {
    final path = await getDatabasesPath();
    final dbPath = join(path, dbFileName);

    return await openDatabase(
      dbPath,
      version: DatabaseConstant.version,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future _onConfigure(Database db) async {}

  // Create database
  Future _onCreate(Database db, int version) async {
    // Types
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const numberType = "INTEGER";
    const textType = "TEXT";

    // Create exercises table schema
    await db.execute('''
    CREATE TABLE ${Exercise.table} (
      ${ExerciseDetail.id} $idType,
      ${ExerciseDetail.sysId} $textType NOT NULL,
      ${ExerciseDetail.name} $textType NOT NULL,
      ${ExerciseDetail.images} $textType,
      ${ExerciseDetail.details} $textType
    )
    ''');

    // Create programs table schema
    await db.execute('''
    CREATE TABLE ${Program.table} (
      ${ProgramDetail.id} $idType,
      ${ProgramDetail.sysId} $textType NOT NULL,
      ${ProgramDetail.name} $textType NOT NULL,
      ${ProgramDetail.days} $numberType NOT NULL,
      ${ProgramDetail.lastCompletedDay} $numberType NOT NULL,
      ${ProgramDetail.status} $textType NOT NULL,
      ${ProgramDetail.images} $textType,
      ${ProgramDetail.details} $textType,
      ${ProgramDetail.level} $textType NOT NULL
    )
    ''');

    // Create workouts table schema
    await db.execute('''
    CREATE TABLE ${Workout.table} (
      ${WorkoutDetail.id} $idType,
      ${WorkoutDetail.sysId} $textType NOT NULL,
      ${WorkoutDetail.programSysId} $textType NOT NULL,
      ${WorkoutDetail.exerciseSysId} $textType NOT NULL,
      ${WorkoutDetail.prevWorkoutSysId} $textType,
      ${WorkoutDetail.type} $textType NOT NULL,
      ${WorkoutDetail.day} $numberType NOT NULL,
      ${WorkoutDetail.status} $textType NOT NULL,
      ${WorkoutDetail.reps} $numberType,
      ${WorkoutDetail.weight} $numberType,
      ${WorkoutDetail.time} $numberType,
      ${WorkoutDetail.restTime} $numberType
    )
    ''');

    // Create programs
    Batch programBatch = db.batch();
    for (var program in programs) {
      programBatch.insert(Program.table, program.toJson());
    }
    programBatch.commit();

    // Create exercises
    Batch exerciseBatch = db.batch();
    for (var exercise in exercises) {
      exerciseBatch.insert(Exercise.table, exercise.toJson());
    }
    exerciseBatch.commit();

    // Create workouts
    Batch workoutBatch = db.batch();
    for (var workout in workouts) {
      workoutBatch.insert(Workout.table, workout.toJson());
    }
    workoutBatch.commit();

    // TODO: Insert default count down (30 sec)
    StorageService.countDown = 30;
  }

  // Insert data
  Future<Model> insertData(Model model) async {
    final db = await instance.database;
    final id = await db.insert(model.tableName, model.toJson());
    return model.copy(id: id);
  }

  // Update data
  Future<int> updateData(Model model, int id) async {
    final db = await instance.database;
    return db.update(
      model.tableName,
      model.toJson(),
      where: '_id = ?',
      whereArgs: [id],
    );
  }

  // Delete Data
  Future<int?> deleteData({
    required String table,
    required int id,
  }) async {
    final db = await instance.database;
    return db.delete(
      table,
      where: '_id = ?',
      whereArgs: [id],
    );
  }

  // Read by sys id
  Future<Model?> readBySysId({
    required String table,
    String columnName = 'sys_id',
    required String sysId,
  }) async {
    final db = await instance.database;

    final result = await db.query(
      table,
      where: '$columnName = ?',
      whereArgs: [sysId],
    );

    if (result.isNotEmpty) {
      if (table == Program.table) {
        return Program.fromJson(result.first);
      }
      if (table == Exercise.table) {
        return Exercise.fromJson(result.first);
      }
      if (table == Workout.table) {
        return Workout.fromJson(result.first);
      }
      return Model.fromJson(
        result.first,
      );
    }
    return null;
  }

  // Read all programs
  Future<List<Program>> readAllPrograms() async {
    final db = await instance.database;

    final result = await db.query(
      Program.table,
    );
    return result.map((json) => Program.fromJson(json)).toList();
  }

  // Read all programs in sysids
  Future<List<Program>> readAllProgramsInSysId(List<String> sysIds) async {
    final db = await instance.database;

    final result = await db.query(
      Program.table,
      where:
          'sys_id IN (${List.generate(sysIds.length, (index) => '?').join(',')})',
      whereArgs: sysIds,
    );
    return result.map((json) => Program.fromJson(json)).toList();
  }

  // Read all exercises
  Future<List<Exercise>> readAllExercises() async {
    final db = await instance.database;

    final result = await db.query(
      Exercise.table,
    );
    return result.map((json) => Exercise.fromJson(json)).toList();
  }

  // Read all workouts for a program
  Future<List<Workout>> readAllWorkoutsForProgram(String programSysId) async {
    final db = await instance.database;

    final result = await db.query(
      Workout.table,
      where: '${WorkoutDetail.programSysId} = ?',
      whereArgs: [programSysId],
    );
    return result.map((json) {
      return Workout.fromJson(
        json,
      );
    }).toList();
  }

  // Close
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
