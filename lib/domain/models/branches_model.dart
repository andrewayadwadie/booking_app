class BranchesModel {
  final int? id;
  final String name;
  final String location;
  final int hotelId;
  const BranchesModel(
      {this.id,
      required this.location,
      required this.hotelId,
      required this.name});

  static BranchesModel fromJson(Map<String, Object?> json) => BranchesModel(
        id: json[BranchesField.id] as int?,
        name: json[BranchesField.name] as String,
        location: json[BranchesField.location] as String,
        hotelId: json[BranchesField.hotelId] as int,
      );

  BranchesModel copy({
    int? id,
    String? name,
    String? location,
    int? hotelId,
  }) =>
      BranchesModel(
          id: id ?? this.id,
          location: location ?? this.location,
          hotelId: hotelId ?? this.hotelId,
          name: name ?? this.name);

  Map<String, Object?> toJson() => {
        BranchesField.id: id,
        BranchesField.name: name,
        BranchesField.location: location,
        BranchesField.hotelId: hotelId
      };
}

class BranchesField {
  static final List<String> values = [id, name, location, hotelId];
  static const String id = '_id';
  static const String name = 'name';
  static const String location = 'location';
  static const String hotelId = 'hotelId';
}
