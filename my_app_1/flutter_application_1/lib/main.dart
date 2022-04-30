import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import './apirequest.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp()); // shortcut to make code cleaner

class MyApp extends StatefulWidget {
  // StatefulWidget is a widget that can be changed, this class is rebuilt each time state changes

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  // this second class is the state and is not rebuilt every time state changes
  //alternative syntax
  // class _MyAppState -> the _ is a private class and is not accessible outside of this file
  // final _questions = [
  //   {
  //     "questionText": "What's your favorite color?",
  //     "answers": [
  //       {"text": "Red", "score": 10},
  //       {"text": "Green", "score": 5},
  //       {"text": "Blue", "score": 2}
  //     ]
  //   },
  //   {
  //     "questionText": "What's your favorite animal?",
  //     "answers": [
  //       {"text": "Dog", "score": 10},
  //       {"text": "Cat", "score": 5},
  //       {"text": "Bird", "score": 2}
  //     ]
  //   },
  //   {
  //     "questionText": "What's your favorite food?",
  //     "answers": [
  //       {"text": "Pizza", "score": 10},
  //       {"text": "Sushi", "score": 5},
  //       {"text": "Pasta", "score": 3},
  //       {"text": "Burger", "score": 1}
  //     ]
  //   }
  // ];

  var _questionIndex = 0;
  var _totalScore = 0;
  final _questionslength = itemCount;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      //setstate forces flutter to re-render, calls build method again of the widget class where is contained
      //flutter has mechanisms to re-render only the part of the widget that has changed
      _questionIndex = _questionIndex + 1;
    }); //we need to add a set state to the function that generates the event and include the logic for changing the state
    //we increase the index with each answer by 1
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions!");
    }
    print('Answer chosen!');
  }

  // variable to keep track of question index

  @override // Override the default build method, we ovverride the build method to return a widget of our own
  // ignore: dead_code, dead_code
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
            )
          : Result(
              _totalScore,
              _resetQuiz,
            ),
    )); // body only admits 1 widget
  }
}
