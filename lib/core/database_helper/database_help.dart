import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/cards/domain/entities/card.dart';

class DatabaseHelper {
  static final _databaseName = "crud.db";
  static final _databaseVersion = 1;
  static final table = 'cards';
  static final numberCard = 'number';
  static final cvcCode = "cvc";
  static final scanCode = "scan";
  static final backImage = 'backImage';
  static final frontImage = 'frontImage';
  static final columnId = '_id';
  static final columnName = 'name';

  // Make this a singleton classF
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Lazily instantiate the database if unavailable
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
           CREATE TABLE $table (
             $columnId INTEGER PRIMARY KEY,
             $backImage TEXT NOT NULL,
             $frontImage TEXT NOT NULL,
             $cvcCode TEXT  NULL,
             $numberCard TEXT  NULL,
             $columnName TEXT NOT NULL,
             $scanCode TEXT NOT NULL
           )
           ''');
  }

  // Insert a note into the database
  Future<int> insert(Card note) async {
    Database db = await instance.database;
      return await db.insert(table, note.toMap());
  }

  // Retrieve all notes from the database
  Future<List<Card>> getAllNotes() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Card.fromMap(maps[i]);
    });
  }

  // Update a note in the database
  Future<int> update(Card note) async {
    Database db = await instance.database;
    return await db.update(table, note.toMap(),
        where: '$columnId = ?', whereArgs: [note.id]);
  }

  // Delete a note from the database
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
