import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController  = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitTX() {
      final titleText   = _titleController.text;
      final amountText  = _amountController.text;

      if (titleText.isEmpty || double.parse(amountText) <= 0 || _selectedDate == null) {
        return;
      }

      widget.addTx(_titleController.text, double.parse(_amountController.text), _selectedDate);

      Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now(),
    ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          this._selectedDate = pickedDate;
        });
        
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitTX(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTX(),
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            Container(
              height: 70,
              child: Row(children: <Widget>[
                  Text(_selectedDate == null ? 'No Date Chosen' : DateFormat.yMd().format(_selectedDate)),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold),),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),), 
              color: Color.fromARGB(255, 14, 13, 72),
              onPressed: _submitTX,
            ),
          ],
        ),
      ),
    );
  }
}