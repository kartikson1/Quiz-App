import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; //good convention, this value will never change after initialization
  //thats what stateless widget really is, its internal state cant change
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
