import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

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
  final _questions = [
    {
      "questionText": "What's your favorite color?",
      "answers": ["Red", "Green", "Blue"]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Dog", "Cat", "Bird"]
    },
    {
      "questionText": "What's your favorite food?",
      "answers": ["Pizza", "Sushi", "Pasta", "Burger"]
    }
  ];
  void _answerQuestion() {
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

  var _questionIndex = 0; // variable to keep track of question index

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
            : Result(),
      ),
    ); // body only admits 1 widget
  }
}
