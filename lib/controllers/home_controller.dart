import 'package:fitness_application/database/database_helper.dart';
import 'package:fitness_application/models/program.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Custom program
  final String _customProgramSysId = 'CTPR';

  // List of skills
  final List<String> _skills = ['PROG0', 'PROG1'];

  // Get all programs from sysIds
  Future _getPrograms(List<String> sysIds) {
    final db = DatabaseHelper.instance;
    return db.readAllProgramsInSysId(sysIds);
  }

  // Getter for all skills
  Future get skills => _getPrograms(_skills);

  // Custom program getter
  Future get customProgram {
    final db = DatabaseHelper.instance;
    return db.readBySysId(Program.table, _customProgramSysId);
  }
}
