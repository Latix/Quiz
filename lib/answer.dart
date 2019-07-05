import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
        width: double.infinity,
        child: RaisedButton(
          child: 
          Text(answerText), 
          onPressed: selectHandler,
          color: Color.fromARGB(255, 14, 13, 72),
          textColor: Colors.white,
        ),
    );
  }
}