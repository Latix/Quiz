import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController  = TextEditingController();

  final amountController = TextEditingController();

  void submitTX() {
      final titleText   = titleController.text;
      final amountText  = amountController.text;

      if (titleText.isEmpty || double.parse(amountText) <= 0) {
        return;
      }

      widget.addTx(titleController.text, double.parse(amountController.text));

      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitTX(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTX(),
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            FlatButton(
              child: Text('Add Transaction', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),), 
              color: Color.fromARGB(255, 14, 13, 72),
              onPressed: submitTX,
            ),
          ],
        ),
      ),
    );
  }
}