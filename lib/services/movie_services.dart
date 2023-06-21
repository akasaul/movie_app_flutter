import '../repository/DB_helper.dart';

class MovieServices {
  Future<void> addToFavorites(String table, Map<String, Object> data) async {
    try {
      await DBHelper.insert(table, data);
    } catch (err) {
      print(err);
    }
  }

  Future<void> removeFromFavorites(String table, int id) async {
    try {
      await DBHelper.removeData(table, id);
    } catch (err) {
      print(err);
    }
  }

  Future<List<Map<String, dynamic>>> getFavorites(String table) async {
    final res = await DBHelper.getData(table);
    print(res);
    return res;
  }

  Future<bool> isFavorite(String table, int id) async {
    return await DBHelper.checkFavorite(table, id);
  }
}
