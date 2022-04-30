import 'package:flutter/material.dart';

import './apirequest.dart';

// class Question extends StatelessWidget {
//   final String questionText; //this tell dart that this value will not change

//   Question(this.questionText);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.all(10),
//       child: Text(
//         questionText,
//         style: TextStyle(fontSize: 28, fontFamily: 'Roboto'),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

//api request and parse json response future builder
class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiRequest.getQuestions(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data[index]['question']),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
