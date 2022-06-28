class Exercise{
  // Modifiable through exercise lifecycle
  int? id;

  // Not modifiable anymore after creation
  final String sysId;
  final String name;
  final String? images;
  final String? details;

  Exercise({
    this.id,
    required this.sysId,
    required this.name,
    this.images,
    this.details,
  });
}