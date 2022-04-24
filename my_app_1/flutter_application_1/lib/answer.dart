import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;

  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed:
            selectHandler, //we need to call it without (), with () flutter executes the function ALWAYS, not only when onpressed
        child: Text("Answer 1"), // content inside the button
      ),
    );
  }
}
