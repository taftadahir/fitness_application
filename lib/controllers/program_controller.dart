import 'package:fitness_application/models/program.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  // List of recommended programs
  List<Program> recommendedPrograms = List.generate(
    3,
    (index) => Program(
      sysId: 'sysId',
      name: 'Pull Up',
      level: ProgramLevel.medium,
      days: index * 10,
      status: ProgramStatus.completed,
    ),
  );
}
