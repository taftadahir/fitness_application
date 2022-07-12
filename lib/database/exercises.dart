import 'package:fitness_application/models/exercise.dart';

List<Exercise> get exercises {
  String? images = '["front_lever.png", "front_lever.png"]';
  String? details =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';

  return [
    Exercise(
      sysId: 'EXE1',
      name: 'Push Up',
      images: images,
      details: details,
    ),
    Exercise(
      sysId: 'EXE2',
      name: 'Pull Up',
      images: images,
      details: details,
    ),
    Exercise(
      sysId: 'EXE3',
      name: 'Diamond Push Up',
      images: images,
      details: details,
    ),
    Exercise(
      sysId: 'EXE4',
      name: 'Spiderman Push Up',
      images: images,
      details: details,
    ),
    Exercise(
      sysId: 'EXE5',
      name: 'Front lever',
      images: images,
      details: details,
    ),
  ];
}
