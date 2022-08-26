import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbName = 'demo.db';
  static final _dbVersion = 1;
  static final _tableName = 'Employee';
  static final columnId = 'ID';
  static final columnName = 'Name';
  static final columnAge = 'AGE';
  static final columnBasic = 'Basic';

// using singleton class

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static  Database ? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _connectDatabase();
    return _database;
  }

  _connectDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/$_dbName';
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) {
    db.execute('''CREATE TABLE $_tableName($columnId INTEGER PRIMARY KEY,
$columnName Text not null,
 $columnAge INTEGER ,
 $columnBasic Integer )''');
  }

//   { value like this is stored in map structure we always in form of  map
//       "ID":1,
//       "Name":'',
//     'AGE':70,
//     'Basic':7000
//
// }
  Future<int?> insertDb(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database;
    return await db!.query(_tableName);
  }

  Future<int?> updatedb(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int ?id = row[columnId];
    await db!.update(_tableName, row, where: '$columnId =?', whereArgs: []);
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(_tableName, where: '$columnId=?', whereArgs: [id]);
  }

  void closeDb() async {
    Database? db = await instance.database;
    await db!.close();
  }

  void openDb() async {
    Database? db = await instance.database;
    print(await db!.isOpen);
  }
}
