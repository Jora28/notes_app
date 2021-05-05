import 'package:exam_cheack_box/screems/notes_page.dart';
import 'package:exam_cheack_box/widgets/button.dart';
import 'package:exam_cheack_box/widgets/inputs.dart';
import 'package:exam_cheack_box/utils/model.dart';
import 'package:exam_cheack_box/utils/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddNotePage extends StatefulWidget {
  static final routeName = "AddNotePage";
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _formState = GlobalKey<FormState>();
  Input input;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String title;
  String description;
  var uid = Uuid();
  void onPressed(BuildContext context) {
    if (!_formState.currentState.validate()) {
      return;
    }
    _formState.currentState.save();

    if (input == null) {
      var newTitle = Input(title: title, description: description);
      DBProvider.db.newInput(newTitle);
      Navigator.of(context).pushReplacementNamed(NotesPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushReplacementNamed(NotesPage.routeName)
        ),
        title: Text("Add Note"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Form(
      key: _formState,
      child: Stack(
        children: [
          CustomInput(
            onChenge: (v) {
              setState(() {
                title = v;
              });
            },
            controller: _titleController,
            hintText: "Title",
            validator: (v) => v.isEmpty ? "Enter A Title" : null,
            obscureText: false,
            prefix: Icons.ac_unit,
            suffix: Icons.clear,
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: CustomInput(
              onChenge: (v) {
                setState(() {
                  description = v;
                });
              },
              controller: _descriptionController,
              hintText: "Description",
              validator: (v) => v.isEmpty ? "Enter A Description" : null,
              obscureText: false,
              prefix: Icons.ac_unit,
              suffix: Icons.clear,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustumButton(
                text: "Create Work",
                onTap: () {
                  onPressed(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
