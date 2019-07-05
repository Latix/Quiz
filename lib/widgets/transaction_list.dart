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
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
                child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
                  decoration: BoxDecoration(
                    border: Border.all(
                    color: Color.fromARGB(255, 14, 13, 72), 
                    width: 2,),
                    ),
                  padding: EdgeInsets.all(10),
                  child: Text(transactions[index].amount.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(transactions[index].title, style: TextStyle(
                      fontSize: 18, 
                      fontWeight: 
                      FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date), 
                      style: TextStyle(
                        color: Colors.grey,
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