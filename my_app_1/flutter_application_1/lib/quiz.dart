import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
            //we are using the custom widget built in question.dart
            questions[questionIndex]["questionText"]
                as String), //could use questions.elementAt(0)
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          // the ... takes all values in a list and get them out of the list to the parent widget
          // in this case, we add the values of a list to the parent widget list
          return Answer(
              () => answerQuestion(answer["score"]), answer["text"] as String);
        }).toList()
      ],
    );
  }
}
