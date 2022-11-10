import 'package:flutter/material.dart';
import 'grades.dart';
import 'gradesList.dart';
import 'package:grading/GradeModel.dart';

/***
 * This is the GradeForm class. I was able to add grades to the DB here
 *
 * Unimplemented functions: editGrade()
 */

class GradeForm extends StatefulWidget {
  const GradeForm({Key? key}) : super(key: key);

  @override
  State<GradeForm> createState() => _GradeFormState();
}

class _GradeFormState extends State<GradeForm> {

  String? _sid;
  String? _grade;
  var _lastInsertedId = 0;
  var _model = GradeModel();
  var _replaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Grade"),
      ),
      body: Form(child:

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                child: Text("SID:"),
              ),
              Container(
                width: 250,
                child: TextFormField(
                onChanged: (value){
                  _sid = value;
                }
                ,
                ),
              ),

            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,

                child: Text("Grade:"),
              ),
              Container(
                width: 250,
                child: TextFormField(
                onChanged: (value){
                  _grade = value;
                },
                ),
              )

            ],
          ),

        ],
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _addGrade();
        },
        child: Icon(Icons.save),
      ),
    );
  }
  Future _addGrade() async{
    grades grade = grades(sid: _sid, grade: _grade);
    if (_replaceId != null){
      grade.id = _replaceId;
    }
    _lastInsertedId = await _model.insertGrade(grade);
  }
}
