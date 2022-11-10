import 'package:flutter/material.dart';
import 'GradeModel.dart';
import 'main.dart';
import 'gradesView.dart';
import 'grades.dart';

/***
 * This class is the main page for the app that shows the list of grades
 * It is currently unfinished, i was not able to figure out how to pull information
 * from the DB and display it here
 *
 * Unimplemented Functions: edit grade
 */




class ListGrades extends StatefulWidget {
  ListGrades({Key? key, this.title}) : super(key: key);
  String? title;
  @override
  State<ListGrades> createState() => _ListGradesState();
}

class _ListGradesState extends State<ListGrades> {
  int? _selectedIndex = -1;

  String? sid;
  String? _grade;
  var _lastInsertedId = 0;
  var _model = GradeModel();
  var _replaceId;

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(
        title: Text("Forms and SQLite"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push( context, MaterialPageRoute(builder: (context) => GradeForm()));

          }, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){
            _deleteGrade();
          }, icon: Icon(Icons.delete))
        ],
      ),
      body:

      ListView.builder(
      itemBuilder: (BuildContext context,int index){
        return Column(
          children: [

            Card(
                child:
                Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: index == _selectedIndex ? Colors.blue : Colors.white),
                    ),
                    child:
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selectedIndex == index) {
                              _selectedIndex = -1;
                            } else {
                              _selectedIndex = index;
                            }
                          });
                        },
                        child:
                        ListTile(
                          title: Text("123456789"),
                          subtitle: Text("C+"),
                        )
                    )
                )
            ),


          ],
        );
      },
    ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
      Navigator.push( context, MaterialPageRoute(builder: (context) => GradeForm()));
    }
    ,
    child: const Icon(Icons.add),
    ),
      );
  }
  Future _addGrade() async{
    grades grade = grades(sid: sid, grade: _grade);
    if (_replaceId != null){
      grade.id = _replaceId;
    }
    _lastInsertedId = await _model.insertGrade(grade);
  }
  void _deleteGrade(){
    _model.deleteGradeWithId(_replaceId);
  }

  Future editGrade() async{
    grades grade = grades(sid: sid, grade: _grade);
    grade.id = _lastInsertedId;
    _model.updateGrade(grade);
  }
  Future _readGrades() async{
    List gradesList = await _model.getAllGrades();
    print('');
    print("Grades:");
    for (grades grade in gradesList){
      print(grade);
    }
  }
}


