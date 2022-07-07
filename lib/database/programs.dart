import 'package:fitness_application/models/program.dart';

List<Program> get programs {
  // These properties to delete
  String? images =
      '["front_lever.png", "front_lever.png", "front_lever.png", "front_lever.png"]';

  String details =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nam in sit. Ultricies vehicula montes, neque, pulvinar vulputate enim felis, porttitor amet. Massa, sagittis bibendum ut eu lectus maecenas. At sed maecenas a dignissim lectus.';
  return [
    Program(
      sysId: 'CTPR',
      name: 'For test',
      days: 5,
      images: images,
      details: details,
      level: ProgramLevel.starter,
      status: ProgramStatus.notStarted,
    ),
    Program(
      sysId: 'CTPPROG0',
      name: 'For test',
      days: 5,
      images: images,
      details: details,
      level: ProgramLevel.starter,
      status: ProgramStatus.notStarted,
    ),
    Program(
      sysId: 'CTPPROG1',
      name: 'For test',
      days: 5,
      images: images,
      details: details,
      level: ProgramLevel.starter,
      status: ProgramStatus.notStarted,
    ),
    Program(
      sysId: 'CTPPROG2',
      name: 'For test',
      days: 5,
      images: images,
      details: details,
      level: ProgramLevel.starter,
      status: ProgramStatus.notStarted,
    ),
  ];
}
