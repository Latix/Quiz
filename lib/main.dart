import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  // String titleInput;
  // String amountInput;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApps'),
        backgroundColor: Color.fromARGB(255, 14, 13, 72),
      ),
      body: SingleChildScrollView(
            child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Color.fromARGB(255, 14, 13, 72),
                child: Text('Chart!'),
                elevation: 5,
              ),
            ),
            UserTransactions(),
          ],
        ),
      ), 
    ); 
  }
}  
