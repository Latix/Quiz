import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// import  './question.dart';
// import './answer.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
        {
          'questionsText': 'What is your favorite colour', 
          'answers':[
            {'text': 'black', 'score': 10}, 
            {'text': 'red', 'score': 5}, 
            {'text': 'yellow', 'score': 6},
          ],
        },
        {
          'questionsText': 'What is your favorite animal', 
          'answers':[
            {'text': 'cat', 'score': 10},
            {'text': 'dog', 'score': 6},
            {'text': 'sheep', 'score': 5},
          ],
        },
        {
          'questionsText': 'What is your favorite food', 
          'answers':[
            {'text': 'bread', 'score': 10},
            {'text': 'rice', 'score': 6},
            {'text': 'beans', 'score': 5},
          ],
        },
      ];

  var _questionIndex = 0;
  var _totalScore    = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore    = 0;
    });
  }
  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
        setState(() {
          _questionIndex += 1;
        });
    } else {
        print('Question finished!');
    }
    
    print('This is the answer');
  }

  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Color.fromARGB(255, 14, 13, 72),
      ),
        body: _questionIndex < _questions.length ?  
          Quiz(
            answerQuestion: _answerQuestion, 
            questionIndex: _questionIndex, 
            questions: _questions,
          )
         : Result(_totalScore, _resetQuiz),
      ), 
    ); 
  }
}
