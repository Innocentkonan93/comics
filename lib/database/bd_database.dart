import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BdDatabase {
  BdDatabase._();
  static final BdDatabase instance = BdDatabase._();
  static Database _database;

  Future<Database> get database async{
    if(_database != null) return database;
    _database = await initDB();
    return _database;
  }
  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
        join( await getDatabasesPath(), 'BdDatabase'),
        onCreate: (db, version){
          return db.execute(
            "CREATE TABLE BD (idbd TEXT PRIMARY KEY, titleBd TEXT, imageUrl TEXT, resumeBd TEXT, isFavorite INTEGER, favoriteCount INTEGER)"
          );
        },
        version: 1
    );
  }


}