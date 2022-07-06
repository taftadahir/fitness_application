import 'package:fitness_application/models/workout.dart';
import 'package:get/get.dart';

class ReorderController extends GetxController {
  // All list of workouts to reorder
  late List<Workout> workouts;

  void onReorder(int oldIndex, int newIndex) {
    final workout = workouts.removeAt(oldIndex);
    workouts.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, workout);
    update();
  }

  void save() {
    // TODO: When saving, we need to show a loading icon and prevent user to do things until completion
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    workouts = List.generate(
      3,
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
        day: 15,
      ),
    );
  }
}
