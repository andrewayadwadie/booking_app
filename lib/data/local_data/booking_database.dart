import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class BookingDatabase {
  static final BookingDatabase instance = BookingDatabase._init();
  static Database? _database;
  BookingDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('booking.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {}

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
