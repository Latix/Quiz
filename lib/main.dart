import 'package:flutter/material.dart';
import  './question.dart';
import './answer.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print('This is the answer');
  }

  @override
  Widget build(BuildContext context){
    var questions = [
        {
          'questionsText': 'What is your favorite colour', 
          'answers':[
            'black', 'red', 'yellow'
          ],
        },
        {
          'questionsText': 'What is your favorite animal', 
          'answers':[
            'cat', 'dog', 'sheep'
          ],
        },
        {
          'questionsText': 'What is your favorite food', 
          'answers':[
            'bread', 'rice', 'beans'
          ],
        },
      ];
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Color.fromARGB(255, 14, 13, 72),
      ), //AppBar
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionsText'],
            ),
            // Answer(_answerQuestion, 'kk'),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ), 
    ); 
  }
}
