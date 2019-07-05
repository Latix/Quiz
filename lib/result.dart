import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  Result(this.resultScore);

  String get resultPhrase
  {
    var text = (resultScore <= 8) ? 'You are Good \n Score is $resultScore' : 'You are bad \n Score is $resultScore';
    return text;
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: 
      Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}