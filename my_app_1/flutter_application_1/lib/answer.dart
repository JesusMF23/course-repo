import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  //final if a value doesn't change when the program launches, runtime constant

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(2),
      //const is a compile time constant
      padding: const EdgeInsets.all(2),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed:
            selectHandler, //we need to call it without (), with () flutter executes the function ALWAYS, not only when onpressed
        child: Text(answerText), // content inside the button
      ),
    );
  }
}
