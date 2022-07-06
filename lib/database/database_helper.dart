import 'package:fitness_application/constants/database_constant.dart';
import 'package:fitness_application/models/exercise.dart';
import 'package:fitness_application/models/model.dart';
import 'package:fitness_application/models/program.dart';
import 'package:fitness_application/models/workout.dart';
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
      onCreate: _createDatabase,
    );
  }

  // Create database
  Future _createDatabase(Database db, int version) async {
    // Types
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    // const boolType = "BOOLEAN NOT NULL";
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
  }

  // Datas to insert on the database
  List<Program> get programs {
    // These properties to delete
    String? images =
        '["front_lever.png", "front_lever.png", "front_lever.png", "front_lever.png"]';

    String details =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';
    return [];
  }

  List<Exercise> get exercises {
    String images = '["front_lever.png", "front_lever.png"]';
    String details =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';
    return [];
  }

  List<Workout> get workouts {
    return [];
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
  Future<Model> readBySysId(String table, String sysId) async {
    final db = await instance.database;

    final result = await db.query(
      table,
      where: 'sys_id = ?',
      whereArgs: [sysId],
    );
    return Model.fromJson(
      result.first,
    );
  }

  // Read all programs
  Future<List<Program>> readAllPrograms() async {
    final db = await instance.database;

    final result = await db.query(
      Program.table,
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
