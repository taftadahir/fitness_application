class Program {
  // Modifiable through program lifecycle
  int? id;
  int days;
  String? images;
  String? details;
  ProgramStatus status;

  // Not modifiable anymore after creation
  final String name;
  final String sysId;
  final ProgramLevel level;

  Program({
    this.id,
    required this.sysId,
    required this.name,
    required this.level,
    required this.days,
    required this.status,
    this.images,
    this.details,
  });
}

enum ProgramLevel {
  starter,
  medium,
  advanced,
}

extension ProgramLevelExtension on ProgramLevel {
  String get name {
    switch (this) {
      case ProgramLevel.starter:
        return 'Starter';
      case ProgramLevel.medium:
        return 'Medium';
      default:
        return 'Advanced';
    }
  }
}

enum ProgramStatus {
  notStarted,
  inProgress,
  completed,
}

extension ProgramStatusExtension on ProgramStatus {
  String get name {
    switch (this) {
      case ProgramStatus.notStarted:
        return 'Not started';
      case ProgramStatus.inProgress:
        return 'In progress';
      default:
        return 'Completed';
    }
  }
}
