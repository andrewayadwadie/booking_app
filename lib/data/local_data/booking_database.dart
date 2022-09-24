import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../../app/db_tables_names.dart';
import '../../app/sql_constants.dart';
import '../../domain/models/branches_model.dart';
import '../../domain/models/hotels_model.dart';
import '../../domain/models/reservation_model.dart';
import '../../domain/models/rooms_model.dart';
import '../../domain/models/rooms_type_model.dart';
import '../../domain/models/user_model.dart';

class BookingDatabase {
  static final BookingDatabase instance = BookingDatabase._init();
  static Database? _database;
  BookingDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('booking.db');
    return _database!;
  }

  //!init DataBase File
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  //! create tables
  Future _createDb(Database db, int version) async {
    db.execute('''
CREATE TABLE ${DbTabelsNames.hotels} (
  ${HotelsField.id} ${SqlConst.idType},
  ${HotelsField.name} ${SqlConst.textType}
)
''');
    db.execute('''
CREATE TABLE ${DbTabelsNames.branches} (
  ${BranchesField.id} ${SqlConst.idType},
  ${BranchesField.name} ${SqlConst.textType},
  ${BranchesField.location} ${SqlConst.textType},
  ${BranchesField.hotelId} ${SqlConst.intType}
)
''');

    db.execute('''
CREATE TABLE ${DbTabelsNames.reservations} (
  ${ReservationField.id} ${SqlConst.idType},
  ${ReservationField.price} ${SqlConst.doubleType},
  ${ReservationField.fromDate} ${SqlConst.textType},
  ${ReservationField.toDate} ${SqlConst.textType},
  ${ReservationField.roomId} ${SqlConst.intType},
  ${ReservationField.userId} ${SqlConst.intType}
)
''');
    db.execute('''
CREATE TABLE ${DbTabelsNames.rooms} (
  ${RoomsField.id} ${SqlConst.idType},
  ${RoomsField.status} ${SqlConst.intType},
  ${RoomsField.roomNumber} ${SqlConst.intType},
  ${RoomsField.roomTypeId} ${SqlConst.intType},
  ${RoomsField.branchId} ${SqlConst.intType}
)
''');
    db.execute('''
CREATE TABLE ${DbTabelsNames.roomsType} (
  ${RoomTypeField.id} ${SqlConst.idType},
  ${RoomTypeField.peopleCount} ${SqlConst.intType},
  ${RoomTypeField.name} ${SqlConst.textType}
)
''');
    db.execute('''
CREATE TABLE ${DbTabelsNames.user} (
  ${UserField.id} ${SqlConst.idType},
  ${UserField.name} ${SqlConst.textType},
  ${UserField.phone} ${SqlConst.textType},
  ${UserField.email} ${SqlConst.textType},
  ${UserField.password} ${SqlConst.textType},
  ${UserField.discount} ${SqlConst.boolType}
)
''');
  }

  //! create
  Future<HotelsModel> createHotel(HotelsModel hotel) async {
    final db = await instance.database;
    final id = await db.insert(DbTabelsNames.hotels, hotel.toJson());
    return hotel.copy(id: id);
  }

  Future<BranchesModel> createBranches(BranchesModel branch) async {
    final db = await instance.database;
    final id = await db.insert(DbTabelsNames.branches, branch.toJson());
    return branch.copy(id: id);
  }

  Future<RoomsModel> createRooms(RoomsModel room) async {
    final db = await instance.database;
    final id = await db.insert(DbTabelsNames.rooms, room.toJson());
    return room.copy(id: id);
  }

  Future<RoomTypeModel> createRoomTypes(RoomTypeModel roomType) async {
    final db = await instance.database;
    final id = await db.insert(DbTabelsNames.roomsType, roomType.toJson());
    return roomType.copy(id: id);
  }

  Future<ReservationModel> createReservstion(ReservationModel reservstion) async {
    final db = await instance.database;
    final id =
        await db.insert(DbTabelsNames.reservations, reservstion.toJson());
    return reservstion.copy(id: id);
  }

  Future<UserModel> createUser(UserModel user) async {
    final db = await instance.database;
    final id = await db.insert(DbTabelsNames.user, user.toJson());
    return user.copy(id: id);
  }

  //!Read
  Future<HotelsModel> readHotel(int id) async {
    final db = await instance.database;
    final maps = await db.query(DbTabelsNames.hotels,
        columns: HotelsField.values,
        where: '${HotelsField.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return HotelsModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<HotelsModel>> readAllHotels() async {
    final db = await instance.database;
    const orderBy = '${HotelsField.id} ASC';
    final result = await db.query(DbTabelsNames.hotels, orderBy: orderBy);
    return result.map((json) => HotelsModel.fromJson(json)).toList();
  }

  Future<BranchesModel> readBranch(int id) async {
    final db = await instance.database;
    final maps = await db.query(DbTabelsNames.branches,
        columns: BranchesField.values,
        where: '${BranchesField.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return BranchesModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<BranchesModel>> readAllBranches() async {
    final db = await instance.database;
    const orderBy = '${BranchesField.id} ASC';
    final result = await db.query(DbTabelsNames.branches, orderBy: orderBy);
    return result.map((json) => BranchesModel.fromJson(json)).toList();
  }

  Future<RoomsModel> readRoom(int id) async {
    final db = await instance.database;
    final maps = await db.query(DbTabelsNames.rooms,
        columns: RoomsField.values,
        where: '${RoomsField.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return RoomsModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<RoomsModel>> readAllRooms() async {
    final db = await instance.database;
    const orderBy = '${RoomsField.id} ASC';
    final result = await db.query(DbTabelsNames.rooms, orderBy: orderBy);
    return result.map((json) => RoomsModel.fromJson(json)).toList();
  }

  Future<RoomTypeModel> readRoomType(int id) async {
    final db = await instance.database;
    final maps = await db.query(DbTabelsNames.roomsType,
        columns: RoomTypeField.values,
        where: '${RoomTypeField.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return RoomTypeModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<RoomTypeModel>> readAllRoomsTypes() async {
    final db = await instance.database;
    const orderBy = '${RoomTypeField.id} ASC';
    final result = await db.query(DbTabelsNames.roomsType, orderBy: orderBy);
    return result.map((json) => RoomTypeModel.fromJson(json)).toList();
  }

  Future<ReservationModel> readReservation(int id) async {
    final db = await instance.database;
    final maps = await db.query(DbTabelsNames.reservations,
        columns: ReservationField.values,
        where: '${ReservationField.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return ReservationModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<ReservationModel>> readAllReservations() async {
    final db = await instance.database;
    const orderBy = '${ReservationField.id} ASC';
    final result = await db.query(DbTabelsNames.reservations, orderBy: orderBy);
    return result.map((json) => ReservationModel.fromJson(json)).toList();
  }

  Future<UserModel> readUser(int id) async {
    final db = await instance.database;
    final maps = await db.query(DbTabelsNames.user,
        columns: UserField.values,
        where: '${UserField.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<UserModel>> readAllUsers() async {
    final db = await instance.database;
    const orderBy = '${UserField.id} ASC';
    final result = await db.query(DbTabelsNames.user, orderBy: orderBy);
    return result.map((json) => UserModel.fromJson(json)).toList();
  }

  //!update
  Future<int> updateHotel(HotelsModel hotel) async {
    final db = await instance.database;
    return db.update(
      DbTabelsNames.hotels,
      hotel.toJson(),
      where: '${HotelsField.id} = ?',
      whereArgs: [hotel.id],
    );
  }

  Future<int> updateBranch(BranchesModel branch) async {
    final db = await instance.database;
    return db.update(
      DbTabelsNames.branches,
      branch.toJson(),
      where: '${BranchesField.id} = ?',
      whereArgs: [branch.id],
    );
  }

  Future<int> updateRoom(RoomsModel room) async {
    final db = await instance.database;
    return db.update(
      DbTabelsNames.rooms,
      room.toJson(),
      where: '${RoomsField.id} = ?',
      whereArgs: [room.id],
    );
  }

  Future<int> updateRoomType(RoomTypeModel roomtype) async {
    final db = await instance.database;
    return db.update(
      DbTabelsNames.roomsType,
      roomtype.toJson(),
      where: '${RoomTypeField.id} = ?',
      whereArgs: [roomtype.id],
    );
  }

  Future<int> updateReservation(ReservationModel reservation) async {
    final db = await instance.database;
    return db.update(
      DbTabelsNames.reservations,
      reservation.toJson(),
      where: '${ReservationField.id} = ?',
      whereArgs: [reservation.id],
    );
  }

  Future<int> updateUser(UserModel user) async {
    final db = await instance.database;
    return db.update(
      DbTabelsNames.user,
      user.toJson(),
      where: '${UserField.id} = ?',
      whereArgs: [user.id],
    );
  }

  //! delete
  Future<int> deleteHotel(int id) async {
    final db = await instance.database;
    return await db.delete(
      DbTabelsNames.hotels,
      where: '${HotelsField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteBranch(int id) async {
    final db = await instance.database;
    return await db.delete(
      DbTabelsNames.branches,
      where: '${BranchesField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteRoom(int id) async {
    final db = await instance.database;
    return await db.delete(
      DbTabelsNames.rooms,
      where: '${RoomsField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteRoomType(int id) async {
    final db = await instance.database;
    return await db.delete(
      DbTabelsNames.rooms,
      where: '${RoomTypeField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteReservation(int id) async {
    final db = await instance.database;
    return await db.delete(
      DbTabelsNames.reservations,
      where: '${ReservationField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete(
      DbTabelsNames.user,
      where: '${UserField.id} = ?',
      whereArgs: [id],
    );
  }

  //! close DataBase
  Future close() async {
    final db = await instance.database;
    db.close();
  }


}
