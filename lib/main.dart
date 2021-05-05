import 'package:exam_cheack_box/screems/add_page.dart';
import 'package:exam_cheack_box/screems/notes_page.dart';
import 'package:exam_cheack_box/utils/colors.dart';
import 'package:exam_cheack_box/utils/database.dart';
import 'package:exam_cheack_box/utils/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
  

class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  List<Input> list  = [];

  getData()async{
    var a = await DBProvider.db.getInputs();
    setState(() {
      list = a;
    });
  }
  @override
  void initState() { 
    getData();
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: newColor3),
      initialRoute: list == null ? AddNotePage.routeName:NotesPage.routeName,
      routes: {
        AddNotePage.routeName:(c)=> AddNotePage(),
        NotesPage.routeName:(c)=> NotesPage(),
      },
    );
  }
}
