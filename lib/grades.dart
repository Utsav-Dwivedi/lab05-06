import 'package:flutter/material.dart';


class grades {
  int? id;
  String? sid;
  String? grade;

  grades({this.id, this.sid, this.grade});

  grades.fromMap(Map map){
    this.id = map['id'];
    this.sid = map['sid'];
    this.grade = map['grade'];
  }

  Map<String,Object?> toMap(){
    return {
      'id': this.id,
      'sid': this.sid,
      'grade': this.grade
    };
  }
}