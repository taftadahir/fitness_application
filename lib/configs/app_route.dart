import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/views/screens/add_workout_choose_exercise_screen.dart';
import 'package:fitness_application/views/screens/add_workout_screen.dart';
import 'package:fitness_application/views/screens/analytic_screen.dart';
import 'package:fitness_application/views/screens/custom_program_reorder_screen.dart';
import 'package:fitness_application/views/screens/custom_program_screen.dart';
import 'package:fitness_application/views/screens/exercise_screen.dart';
import 'package:fitness_application/views/screens/favorite_screen.dart';
import 'package:fitness_application/views/screens/home_screen.dart';
import 'package:fitness_application/views/screens/onboarding_screen.dart';
import 'package:fitness_application/views/screens/profile_screen.dart';
import 'package:fitness_application/views/screens/program_detail_screen.dart';
import 'package:fitness_application/views/screens/program_screen.dart';
import 'package:fitness_application/views/screens/register_screen.dart';
import 'package:fitness_application/views/screens/rest_screen.dart';
import 'package:fitness_application/views/screens/result_screen.dart';
import 'package:fitness_application/views/screens/setting_screen.dart';
import 'package:fitness_application/views/screens/workout_on_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  // App route
  static List<GetPage<dynamic>> get pages => [
        GetPage(
          name: RouteConstant.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RouteConstant.onboardingScreen,
          page: () => const OnboardingScreen(),
        ),
        GetPage(
          name: RouteConstant.programScreen,
          page: () => const ProgramScreen(),
        ),
        GetPage(
          name: RouteConstant.programDetailScreen,
          page: () => const ProgramDetailScreen(),
        ),
        GetPage(
          name: RouteConstant.registerScreen,
          page: () => const RegisterScreen(),
        ),
        GetPage(
          name: RouteConstant.exerciseScreen,
          page: () => const ExerciseScreen(),
        ),
        GetPage(
          name: RouteConstant.favoriteScreen,
          page: () => const FavoriteScreen(),
        ),
        GetPage(
          name: RouteConstant.customProgramScreen,
          page: () => const CustomProgramScreen(),
        ),
        GetPage(
          name: RouteConstant.customProgramReorderScreen,
          page: () => const CustomProgramReorderScreen(),
        ),
        GetPage(
          name: RouteConstant.resultScreen,
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: RouteConstant.restScreen,
          page: () => const RestScreen(),
        ),
        GetPage(
          name: RouteConstant.workoutOnScreen,
          page: () => const WorkoutOnScreen(),
        ),
        GetPage(
          name: RouteConstant.settingScreen,
          page: () => const SettingScreen(),
        ),
        GetPage(
          name: RouteConstant.profileScreen,
          page: () => const ProfileScreen(),
        ),
        GetPage(
          name: RouteConstant.addWorkoutScreen,
          page: () => const AddWorkoutScreen(),
        ),
        GetPage(
          name: RouteConstant.addWorkoutChooseExerciseScreen,
          page: () => const AddWorkoutChooseExerciseScreen(),
        ),
        GetPage(
          name: RouteConstant.analyticScreen,
          page: () => const AnalyticScreen(),
        ),
      ];

  // Initial app route
  static String get initialRoute => RouteConstant.homeScreen;
}
