import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './config/initializations.dart';
import 'package:flutter/services.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(MyApp());
} 

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

class MyHomePage extends StatefulWidget {
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
  
  bool _showChart = false;

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
    final mediaQuery                 = MediaQuery.of(context);
    final _isLandscape               = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS ? 
    CupertinoNavigationBar(
      middle: Text(Init.appName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: Icon(CupertinoIcons.add),
            onTap: () =>  _startAddNewTransaction(context)
          )
        ],
      ),
    ) 
    : AppBar(
        title: Text(Init.appName),
        backgroundColor: Color.fromARGB(255, 14, 13, 72),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () => _startAddNewTransaction(context)
          ),
        ],
      );
    
    final txList =  Container(
      height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    final pageBody = SafeArea (
          child: SingleChildScrollView(
            child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (_isLandscape)  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Show Chart', style: Theme.of(context).textTheme.title),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart, 
                    onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },),
                ],
              ),
              if (!_isLandscape) 
                Container(
                  height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.3,
                  child: Chart(_recentTransaction),
                ), 
              if (!_isLandscape)
                txList,

              if (_isLandscape) _showChart ? Container(
              height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.7,
              child: Chart(_recentTransaction),
            ) :
              txList
          ],
        ),
      ),
    );
    return Platform.isIOS ? 
      CupertinoPageScaffold(
        child: pageBody,
        navigationBar: appBar,
      ) 
      : Scaffold(
      appBar: appBar,
      body: pageBody,  
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(
        child: Icon(Icons.add), 
        onPressed: () => _startAddNewTransaction(context),),
    ); 
  }
}  
