import 'package:exam_cheack_box/screems/add_page.dart';
import 'package:exam_cheack_box/utils/colors.dart';
import 'package:exam_cheack_box/utils/database.dart';
import 'package:exam_cheack_box/utils/model.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  static final routeName = "NotesPage";
  NotesPage({Key key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Input> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Note"),
        icon: Icon(Icons.add),
        backgroundColor: newColor3,
        splashColor: newColor3,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(AddNotePage.routeName);
        },
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Notes"),
      ),
      body: _body(),
    );
  }

  void getData() async {
    var a = await DBProvider.db.getInputs();
    list = a;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget _body() {
    return Stack(
      children: [
        list != null
            ? Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      Input input = list[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: newColor3,
                              width: 1,
                            )),
                        margin: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text('Title:${input.title}')),
                                Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                        'Description:${input.description}')),
                              ],
                            ),
                            Spacer(),
                            Container(
                                child: IconButton(
                                    onPressed: () {
                                      DBProvider.db.delete(input.title);
                                      setState(() {
                                        list.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    )))
                          ],
                        ),
                      );
                    }))
            : Container(),
      ],
    );
  }
}
