import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io'as io;

import '../models/UserModel.dart';
class  dbHelper{
  static Database? _db;
  static const String Table_user="User";
  static const String DB_Name="test1.db";
  static const int version=1;
  static const String c_id = "userid";
  static const String c_username="username";
  static const String c_email="userEmail";
  static const String c_password="userPassword";

  Future<Database?> get db async{
    if(_db==null){
      _db=await initalDB();
      return _db;
    }
    else{
      return _db;
    }
  }
  initalDB() async {
    io.Directory documentsDirectory=await getApplicationDocumentsDirectory();
    String path=join(documentsDirectory.path,DB_Name);
    Database db=await openDatabase(path,version: version,onCreate: _oncreate);
    return db;
  }
  _oncreate(Database db, int iversion) async {
    await db.execute("CREATE TABLE $Table_user ("
        "$c_id TEXT PRIMARY KEY,"
        "$c_username TEXT,"
        "$c_email TEXT,"
        "$c_password TEXT"
        ")");
    print("Create DB");
  }
  Future<int?> saveData(usermodel user)async{
     var dbclient=await db;
     var result=(await dbclient?.insert(Table_user, user.toMap())) ;
     return result;
  }
  Future<usermodel?> getloginuser(String userid,String password)async{
    var dbclient=await db;
    var result=await dbclient?.rawQuery("SELECT * FROM $Table_user WHERE $c_id='$userid' AND $c_password='$password'"
     );
    if(result!.length> 0){
      return usermodel.fromMap(result.first);
    }
     return null;
  }
  Future<int?> updateUser(usermodel user) async {
    var dbClient = await db;
    var res = await dbClient?.update(Table_user, user.toMap(),
        where: '$c_id = ?', whereArgs: [user.userid]);
    return res;
  }

  Future<int?> deleteUser(String user_id) async {
    var dbClient = await db;
    var res = await dbClient
        ?.delete(Table_user, where: '$c_id = ?', whereArgs: [user_id]);
    return res;
  }
  Future<List<Map<String, dynamic>>?> getAllUsers() async {
    final dbClient = await db;
    var res =await dbClient?.query(Table_user);
    return  res;
  }

}
