import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:scstrade_pro/data/dto/Stock_data.dart';
import 'package:sqflite/sqflite.dart';

class ScsDatabase{
  static final ScsDatabase instance = ScsDatabase._internal();
  static Database? _database;
  ScsDatabase._internal();

  Future<Database> get database async{
    if(_database!=null){
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'scstrade_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  FutureOr<void> _createDatabase(Database db,_) async {
    return await db.execute('CREATE TABLE WatchList(id INTEGER PRIMARY KEY AUTOINCREMENT,sym TEXT UNIQUE)');
  }

  Future<void> create(String data) async{
    final db = await instance.database;
    
    // var batch=db.batch();
    try{
      db.rawInsert('INSERT INTO WatchList (sym) VALUES ("$data")');
    }catch(e){
      print(e);
    }

  }

  Future<List<Object?>> readAll() async {
    final db = await instance.database;
    final result = await db.query('WatchList',columns: ['sym']);
    return result.map((element) => element['sym'],).toList();

    // return result.map((json) => StockData.fromJson(json)).toList();
  }

  Future<int> delete() async{
    final db = await instance.database;
    return db.delete('stocks');
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }
}