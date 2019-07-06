import 'package:flutter/material.dart';
import './config/initializations.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor:   Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Workwise',
        textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontSize: 20)),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontSize: 20))),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    //  Transaction(
    //   id: 't1', 
    //   title: 'New Car', 
    //   amount: 69.99, 
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2', 
    //   title: 'New Shoe', 
    //   amount: 199.99, 
    //   date: DateTime.now(),
    // ),
  ];
  
  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
        return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();
  }
  void _addNewTransaction(String title, double amount, DateTime chosenDate)
  {
    final newTx = Transaction(
      title: title, 
      amount: amount, 
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState((){
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
        return GestureDetector( 
          onTap: () {},
          child: NewTransaction(_addNewTransaction), 
          behavior: HitTestBehavior.opaque,
          );
    },);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(Init.appName),
        backgroundColor: Color.fromARGB(255, 14, 13, 72),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () => _startAddNewTransaction(context)
          ),
        ],
      ),
      body: SingleChildScrollView(
            child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), 
        onPressed: () => _startAddNewTransaction(context),),
    ); 
  }
}  
