import 'package:flutter/material.dart';

class ButtonChange extends StatelessWidget {
  final Function changeText;

  ButtonChange(this.changeText);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Change Text'),
        onPressed: changeText,
      ),
    );
  }
}