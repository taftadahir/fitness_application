import 'package:fitness_application/controllers/add_workout_controller.dart';
import 'package:fitness_application/controllers/drawer_controller.dart';
import 'package:fitness_application/controllers/home_controller.dart';
import 'package:fitness_application/controllers/onboarding_controller.dart';
import 'package:fitness_application/controllers/program_controller.dart';
import 'package:fitness_application/controllers/register_controller.dart';
import 'package:fitness_application/controllers/reorder_controller.dart';
import 'package:fitness_application/controllers/setting_controller.dart';
import 'package:fitness_application/controllers/timer_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: Controllers binding
    Get.lazyPut(
      () => ProgramController(),
      fenix: true,
    );
    Get.lazyPut(
      () => DrawerController(),
      fenix: true,
    );
    Get.lazyPut(
      () => OnboardingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => RegisterController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ReorderController(),
      fenix: true,
    );
    Get.lazyPut(
      () => TimerController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SettingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AddWorkoutController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
  }
}
