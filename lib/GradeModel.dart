import 'db_utils.dart';
import 'package:flutter/material.dart';
import 'grades.dart';
import 'package:sqflite/sqflite.dart';

class GradeModel{

  Future getAllGrades() async{
    //This needs to be present in any queries, updates, etc.
    //you do with your database
    final db = await DBUtils.init();
    final List maps = await db.query('grades');
    List result = [];
    for (int i = 0; i < maps.length; i++){
      result.add(
          grades.fromMap(maps[i])
      );
    }
    return result;
  }
  Future<int> insertGrade(grades grade) async{
    //This needs to be present in any queries, updates, etc.
    //you do with your database
    final db = await DBUtils.init();
    return db.insert(
      'grades',
      grade.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateGrade(grades grade) async{
    //This needs to be present in any queries, updates, etc.
    //you do with your database
    final db = await DBUtils.init();
    return db.update(
      'grades',
      grade.toMap(),
      where: 'id = ?',
      whereArgs: [grade.id],
    );
  }
  Future<int> deleteGradeWithId(int id) async{
    //This needs to be present in any queries, updates, etc.
    //you do with your database
    final db = await DBUtils.init();
    return db.delete(
      'grades',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}