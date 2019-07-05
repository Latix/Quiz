import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Color.fromARGB(255, 14, 13, 72),
      ),
        body: Center(
          child: Text('Widget Playing Background'),
        )
      ), 
    ); 
  }
}
