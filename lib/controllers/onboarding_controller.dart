import 'package:fitness_application/database/onboarding_data.dart';
import 'package:fitness_application/models/onboarding.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // Active onboarding element
  int _activeIndex = 0;

  // active index
  int get activeIndex => _activeIndex;
  set activeIndex(int index) {
    _activeIndex = index;
    update();
  }

  // Onboarding data getter
  List<Onboarding> get datas => onBoardingData;
}
