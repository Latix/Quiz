import 'package:flutter/material.dart';
import './button.dart';
import './appBarText.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  String _barText = 'Test 1';
  void _changeText(){
    setState(() {
      this._barText = 'Test Changed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Test 1'),
        backgroundColor: Color.fromARGB(255, 14, 13, 72),
      ),
      body: Column(
        children: <Widget>[
          AppBarText(barText: _barText,),
          ButtonChange(_changeText),
        ],
        ),
      ),
    );
  }
}