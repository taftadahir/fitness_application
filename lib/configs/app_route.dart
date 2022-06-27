import 'package:fitness_application/constants/route_constant.dart';
import 'package:fitness_application/views/screens/home_screen.dart';
import 'package:fitness_application/views/screens/onboarding_screen.dart';
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
      ];

  // Initial app route
  static String get initialRoute => RouteConstant.onboardingScreen;
}
