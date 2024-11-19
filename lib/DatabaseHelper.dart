// يجب حفظ هذا الملف لإنشاء اي قاعدة بيانات

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDb {
  // this is made to not make init again and again
  static Database? _db;
  Future<Database?> get db async{
    if (_db ==null){
      _db = await initalDb();
      return _db;
    }else{
      return _db;
    }
  }
  // here we init the database and creat the tables
  initalDb() async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mazdb.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version:2, onUpgrade:_onUpgrade);
    return mydb;

  }
  _onUpgrade(Database db, int oldversion, int newversion)async{
    await db.execute('''
        CREATE TABLE "products"(
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "pro_name" TEXT NOT NULL,
        "pro_type" TEXT NOT NULL,
        "pro_desc" TEXT NOT NULL
        )
        ''');

    print("onUpgrae =========================");
  }
  _onCreate(Database db, int version) async{
    await db.execute('''
        CREATE TABLE "notes"(
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "note" TEXT NOT NULL
        )
        ''');
    await db.execute('''
        CREATE TABLE "users"(
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "user_name" TEXT NOT NULL,
        "user_password" TEXT NOT NULL
        )
        ''');
    print("======onCreat database and tables ================");
  }


// SELECT
  readData(String sql) async{
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
// INSERT
  insertData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }
// UPDATE
  updateData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
// DELETE
  deleteData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}