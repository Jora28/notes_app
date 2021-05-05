import 'package:flutter/material.dart';



class CustumButton extends StatelessWidget {
  final String text;
  final Function onTap;
  CustumButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    const newColor3 = Color(0xFF205072);
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: newColor3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )),
          child: Text(text),
          onPressed: onTap),
    );
  }
}