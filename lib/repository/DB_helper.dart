import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return await sql.openDatabase(path.join(dbPath, 'favorites.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE favorite_movies(id INTEGER PRIMARY KEY, title TEXT, image TEXT, genre TEXT, rating TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    print('add data');
    final db = await DBHelper.database();
    db.insert(table, data);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    print('get data');
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> removeData(String table, int id) async {
    print('remove data');
    final db = await DBHelper.database();
    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<bool> checkFavorite(String table, int id) async {
    final db = await DBHelper.database();
    final isFav = await db.query(table, where: 'id = ?', whereArgs: [id]);
    return isFav.isEmpty ? true : false;
  }
}
