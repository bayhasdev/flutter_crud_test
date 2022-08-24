library solbooks_dal;

import 'package:flutter/foundation.dart';
import 'package:flutter_crud_test/src/domain_data/data_sources/local/local_database/employee_dto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase _inst = LocalDatabase._internal();

  LocalDatabase._internal();

  factory LocalDatabase({int? dbVersion}) {
    _inst._dbVersion = dbVersion ?? 1;
    return _inst;
  }

  final String dbName = 'test.db';
  late String databasePath;
  Database? _database;

  late int _dbVersion;

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) {
      return _database!;
    }
    return await initialise();
  }

  Future close() async {
    _database?.close();
  }

  Future initialise() async {
    debugPrint('//////// databse is initializing');

    String databaseDir = await getDatabasesPath();
    databasePath = join(databaseDir, dbName);

    try {
      _database = await openDatabase(
        databasePath,
        version: _dbVersion,
        onOpen: (db) async {
          // debugPrint('=================================================== database onOpen : ${db.path}');
          await temp(db);
        },
        onCreate: (Database db, int version) async {
          debugPrint('=================================================== database onCreate : ${db.path}');
          await createsTables(db);
        },
        onConfigure: (db) {
          // debugPrint('=================================================== database onConfigure : ${db.path}');
        },
        onDowngrade: (db, oldVersion, newVersion) {
          // debugPrint('=================================================== database onDowngrade : ${db.path}');
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          // debugPrint('=================database onUpgrade : ${db.path} | oldVersion : $oldVersion | newVersion : $newVersion ');
        },
      );
      return _database;
    } catch (err) {
      debugPrint('xxxxxxxxxxxxxxxx ${err.toString()}');
      throw Exception('fiald to open database connection');
    }
  }

  Future createsTables(Database db, {int? version}) async {
    await createAccountsTable(db);
  }

  Future createAccountsTable(Database db, {int? version}) async {
    await db.execute('''
          create table IF NOT EXISTS ${EmployeeDto.tableName} ( 
            ${EmployeeDto.colId}  integer primary key autoincrement ,  
            ${EmployeeDto.colName}  text not null,
            ${EmployeeDto.colPhone}  text not null,  
            ${EmployeeDto.colCountryCode}  text not null,  
            ${EmployeeDto.colCreateDate} text not null 
            )
          ''');
  }

  Future temp(Database db, {int? version}) async {
    // TODO : delete in production
    // await db.execute('''
    //           ALTER TABLE  ${UserProvider.tableName}
    //       ADD COLUMN    ${UserProvider.columnLastTransUpdate} Text ;
    //       ''');
    // await db.execute('''
    //           ALTER TABLE  ${TransactionProvider.tableName}
    //       RENAME COLUMN toaccountId TO  ${TransactionProvider.columnToAccountId};

    //       ''');
  }
}
