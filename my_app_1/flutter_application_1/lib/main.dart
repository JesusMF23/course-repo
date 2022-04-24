import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      //setstate forces flutter to re-render, calls build method again of the widget class where is contained
      //flutter has mechanisms to re-render only the part of the widget that has changed
      _questionIndex = _questionIndex + 1;
    }); //we need to add a set state to the function that generates the event and include the logic for changing the state
    //we increase the index with each answer by 1
    print('Answer chosen!');
  }

  var _questionIndex = 0; // variable to keep track of question index

  @override // Override the default build method, we ovverride the build method to return a widget of our own
  // ignore: dead_code, dead_code
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite color?",
      "What's your favorite animal?",
      "What's your favorite food?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        body: Column(
          children: [
            Question(//we are using the custom widget built in question.dart
                questions[_questionIndex]), //could use questions.elementAt(0)
            Answer(
                _answerQuestion), //we are using the custom widget built in answer.dart
            Answer(_answerQuestion),
            Answer(_answerQuestion),
          ],
        ),
      ),
    ); // body only admits 1 widget
  }
}
