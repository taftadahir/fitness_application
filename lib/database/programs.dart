import 'package:fitness_application/models/program.dart';

// All programs data
List<Program> get programs {
  // These properties to delete
  String? images =
      '["front_lever.png", "front_lever.png", "front_lever.png", "front_lever.png"]';

  String details =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';
  return [
    Program(
      sysId: 'CTPR',
      name: 'Custom program',
      days: 3,
      lastCompletedDay: 1,
      images: images,
      details: details,
      level: ProgramLevel.starter,
      status: ProgramStatus.inProgress,
    ),
    Program(
      sysId: 'PROG0',
      name: 'Pull Up',
      days: 5,
      lastCompletedDay: 3,
      images: images,
      details: details,
      level: ProgramLevel.starter,
      status: ProgramStatus.notStarted,
    ),
    Program(
      sysId: 'PROG1',
      name: 'Push Up',
      days: 2,
      lastCompletedDay: 1,
      images: images,
      details: details,
      level: ProgramLevel.starter,
      status: ProgramStatus.completed,
    ),
  ];
}
