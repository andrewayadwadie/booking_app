class ReservationModel {
  final int? id;
  final double price;
  final String fromDate;
  final String toDate;
  final int userId;
  final int roomId;

  const ReservationModel({
    this.id,
    required this.price,
    required this.fromDate,
    required this.toDate,
    required this.userId,
    required this.roomId,
  });
  static ReservationModel fromJson(Map<String, Object?> json) =>
      ReservationModel(
        id: json[ReservationField.id] as int?,
        price: json[ReservationField.price] as double,
        fromDate: json[ReservationField.fromDate] as String,
        toDate: json[ReservationField.toDate] as String,
        userId: json[ReservationField.userId] as int,
        roomId: json[ReservationField.roomId] as int,
      );
  ReservationModel copy({
    int? id,
    double? price,
    String? fromDate,
    String? toDate,
    int? userId,
    int? roomId,
  }) =>
      ReservationModel(
        id: id ?? this.id,
        price: price ?? this.price,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        userId: userId ?? this.userId,
        roomId: roomId ?? this.roomId,
      );

  Map<String, Object?> toJson() => {
        ReservationField.id: id,
        ReservationField.price: price,
        ReservationField.fromDate: fromDate,
        ReservationField.toDate: toDate,
        ReservationField.userId: userId,
        ReservationField.roomId: roomId
      };
}

class ReservationField {
  static final List<String> values = [
    id,
    price,
    fromDate,
    toDate,
    userId,
    roomId
  ];
  static const String id = '_id';
  static const String price = 'price';
  static const String fromDate = 'fromDate';
  static const String toDate = 'toDate';
  static const String userId = 'userId';
  static const String roomId = 'roomId';
}
