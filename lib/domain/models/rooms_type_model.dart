class RoomTypeModel {
  final int? id;
  final String name;
  final int peopleCount;
  const RoomTypeModel({this.id, required this.peopleCount, required this.name});

  static RoomTypeModel fromJson(Map<String, Object?> json) => RoomTypeModel(
        id: json[RoomTypeField.id] as int?,
        name: json[RoomTypeField.name] as String,
        peopleCount: json[RoomTypeField.peopleCount] as int,
      );

  RoomTypeModel copy({
    int? id,
    String? name,
    int? peopleCount,
  }) =>
      RoomTypeModel(
          id: id ?? this.id,
          peopleCount: peopleCount ?? this.peopleCount,
          name: name ?? this.name);

  Map<String, Object?> toJson() => {
        RoomTypeField.id: id,
        RoomTypeField.name: name,
        RoomTypeField.peopleCount: peopleCount
      };
}

class RoomTypeField {
  static final List<String> values = [id, name, peopleCount];
  static const String id = '_id';
  static const String name = 'name';
  static const String peopleCount = 'peopleCount';
}
