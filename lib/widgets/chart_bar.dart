import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}', style: TextStyle(fontSize: 100,),),
          ),
        ),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 40,
          child: Stack(children: <Widget>[
              Center(
                child: Container(
                  width: 10,
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Center(
                  child: Container(
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor),
                    ),
                ),
                ),
            ],
          ),
        ),

        SizedBox(height: 4),
      ],
    );
  }
}