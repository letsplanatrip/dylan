import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static final DbHelper instance = DbHelper._init();

  // Private Constructor
  DbHelper._init();

  Future<Database?> get db async {
    if (_db != null) return _db!;
    _db = await _initDB("dylan.db");
    return _db;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    // Create the Flights Database
    await db.execute('''CREATE TABLE flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    eventTs INTEGER NOT NULL,
    flightId TEXT NOT NULL,
    name TEXT NOT NULL,
    pnr TEXT NOT NULL,
    departure INTEGER NOT NULL,
    arrival INTEGER NOT NULL,
    source TEXT NOT NULL,
    destination TEXT NOT NULL,
    seat TEXT NOT NULL,
    fare INTEGER NOT NULL,
    notes TEXT NOT NULL,
    ticket TEXT NOT NULL,
    tripId TEXT NOT NULL
    )''');
  }

  Future close() async {
    final db = await instance.db;
    db?.close();
  }
}
