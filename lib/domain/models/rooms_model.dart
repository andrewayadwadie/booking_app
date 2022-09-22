class RoomsModel {
  final int? id;
  final int roomNumber;
  final int status;
  final int roomTypeId;
  final int branchId;

 const RoomsModel({
    this.id,
    required this.roomNumber,
    required this.status,
    required this.roomTypeId,
    required this.branchId,
  });

  static RoomsModel fromJson(Map<String, Object?> json) => RoomsModel(
        id: json[RoomsField.id] as int?,
        roomNumber: json[RoomsField.roomNumber] as int,
        status: json[RoomsField.status] as int,
        roomTypeId: json[RoomsField.roomTypeId] as int,
        branchId: json[RoomsField.branchId] as int,
      );

  RoomsModel copy({
    int? id,
    int? roomNumber,
    int? status,
    int? roomTypeId,
    int? branchId,
  }) =>
      RoomsModel(
          id: id ?? this.id,
          roomNumber: roomNumber ?? this.roomNumber,
          status: status ?? this.status,
          roomTypeId: roomTypeId ?? this.roomTypeId,
          branchId: branchId ?? this.branchId);

  Map<String, Object?> toJson() => {
        RoomsField.id: id,
        RoomsField.roomNumber: roomNumber,
        RoomsField.status: status,
        RoomsField.roomTypeId: roomTypeId,
        RoomsField.branchId: branchId,
      };
}

class RoomsField {
  static final List<String> values = [
    id,
    roomNumber,
    status,
    roomTypeId,
    branchId
  ];
  static const String id = '_id';
  static const String roomNumber = 'roomNumber';
  static const String status = 'status';
  static const String roomTypeId = 'roomTypeId';
  static const String branchId = 'branchId';
}
