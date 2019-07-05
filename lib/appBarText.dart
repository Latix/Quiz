import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String barText;

  AppBarText({this.barText});

  @override
  Widget build(BuildContext context) {
    return Text(
      barText,
    );
  }
}