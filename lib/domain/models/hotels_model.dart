class HotelsModel {
  final int? id;
  final String name;

  const HotelsModel({this.id, required this.name});
  static HotelsModel fromJson(Map<String, Object?> json) => HotelsModel(
        id: json[HotelsField.id] as int?,
        name: json[HotelsField.name] as String,
      );

  HotelsModel copy({
    int? id,
    String? name,
  }) =>
      HotelsModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Map<String, Object?> toJson() => {
        HotelsField.id: id,
        HotelsField.name: name,
      };
}

class HotelsField {
  static final List<String> values = [
    id,
    name,
  ];
  static const String id = '_id';
  static const String name = 'name';
}
