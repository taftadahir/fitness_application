import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/views/screens/home_screen.dart';
import 'package:fitness_application/views/screens/onboarding_screen.dart';
import 'package:fitness_application/views/screens/program_detail_screen.dart';
import 'package:fitness_application/views/screens/program_screen.dart';
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
      ];

  // Initial app route
  static String get initialRoute => RouteConstant.programDetailScreen;
}
