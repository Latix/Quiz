import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.isEmpty ? Column(children: <Widget>[
        Text('No transactions yet!',  style: Theme.of(context).textTheme.title),
        SizedBox(height: 30),
        Container(
          height: 200,
          child: Image.asset('./assets/images/work-wise.png', 
          fit: BoxFit.cover,
            ),
          ),
      ],) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
                child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
                  decoration: BoxDecoration(
                    border: Border.all(
                    color: Theme.of(context).primaryColor, 
                    width: 2,),
                    ),
                  padding: EdgeInsets.all(10),
                  child: Text(transactions[index].amount.toStringAsFixed(2),
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(transactions[index].title, style: Theme.of(context).textTheme.title),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date), 
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}