import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils{
  static Future init() async{
    //set up the database
    var database = openDatabase(
      path.join(await getDatabasesPath(), 'grades_manger.db'),
      onCreate: (db, version){
        db.execute(
            'CREATE TABLE grades(id INTEGER PRIMARY KEY, SID TEXT, grade TEXT)'
        );
      },
      version: 1,
    );

    print("Created DB $database");
    return database;
  }
}