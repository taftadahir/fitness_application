import 'package:fitness_application/models/onboarding.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  int _activeIndex = 0;
  final List<Onboarding> _datas = [
        Onboarding(
          title: 'Routine',
          image: 'routine.svg',
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.",
        ),
        Onboarding(
          title: 'Workouts',
          image: 'workout.svg',
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.",
        ),
        Onboarding(
          title: 'Programs',
          image: 'program.svg',
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum ac et urna.",
        ),
      ];

  // active index
  int get activeIndex => _activeIndex;
  set activeIndex(int index) {
    _activeIndex = index;
    update();
  }

  // datas getter
  List<Onboarding> get datas => _datas;
}
