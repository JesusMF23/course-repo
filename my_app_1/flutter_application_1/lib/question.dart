import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; //this tell dart that this value will not change

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}
