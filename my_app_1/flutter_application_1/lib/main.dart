import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp()); // shortcut to make code cleaner

class MyApp extends StatelessWidget {
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
          children: const [
            Text("The question!"),
            ElevatedButton(
              onPressed: null,
              child: Text("Answer 1"), // content inside the button
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Answer 2"), // content inside the button
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Answer 3"), // content inside the button
            ),
          ],
        ),
      ),
    ); // body only admits 1 widget
  }
}
