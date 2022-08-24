import 'package:flutter_crud_test/src/domain_data/data_sources/local/local_database/local_database.dart';
import 'package:sqflite/sqlite_api.dart';

class EmployeeDto {
  static const String tableName = 'employees';
  static const String colId = 'id';
  static const String colName = 'name';
  static const String colPhone = 'phone';
  static const String colCountryCode = 'countryCode';
  static const String colCreateDate = 'createDate';

  LocalDatabase database = LocalDatabase();

  Future<List<Map<String, dynamic>>> getAll() async {
    Database db = await database.database;
    return await db.query(tableName, orderBy: '$colId DESC ');
  }

  Future<List<Map<String, dynamic>>> getAccounts({
    Transaction? dbTransaction,
    String? name,
  }) async {
    var db = dbTransaction ?? await database.database;

    String where = 'true ';
    if (name != null && name.isNotEmpty) where += ' AND $colName like %$name% ';

    return await db.query(tableName, where: where);
  }

  Future<Map<String, dynamic>?> getSingle({Transaction? dbTransaction, int? id}) async {
    var db = dbTransaction ?? await database.database;

    String where = 'true ';
    if (id != null) where += ' AND $colId = $id ';

    List<Map<String, dynamic>> maps = await db.query(tableName, where: where);
    if (maps.isNotEmpty) return maps.first;
    return null;
  }

  Future<int> insert(Map<String, dynamic> item) async {
    var db = await database.database;
    try {
      return await db.insert(tableName, item);
    } catch (err) {
      rethrow;
    }
  }

  Future<int> update(Map<String, dynamic> item, int id, {Transaction? dbTransaction}) async {
    try {
      var db = dbTransaction ?? await database.database;
      return await db.update(tableName, item, where: '$colId = ?', whereArgs: [id]);
    } catch (err) {
      rethrow;
    }
  }

  Future<int> delete(int id) async {
    try {
      var db = await database.database;
      return await db.delete(tableName, where: '$colId = ?', whereArgs: [id]);
    } catch (err) {
      rethrow;
    }
  }
}
