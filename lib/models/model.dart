abstract class Model {
  String get tableName => table;
  static String get table => '';

  Map<String, Object?> toJson();

  static Model fromJson(Map<String, Object?> json) {
    throw UnimplementedError();
  }

  Model copy({
    int? id,
    String? sysId,
  });
}
