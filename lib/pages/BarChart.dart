import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileapp/pages/Bar.dart';

class BarChart extends StatelessWidget{
  final List<double> expenses;
  BarChart(this.expenses);


  @override
  Widget build(BuildContext context) {
    double mostExpensvie = 0;
    expenses.forEach((double price){
      if(price > mostExpensvie){
        mostExpensvie = price;
      }
    });
    // TODO: implement build
    return Column(
        children: <Widget>[
          Text("Weekly Spending",
            style: TextStyle
              (fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),),
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon:Icon(Icons.arrow_back_ios),
                  iconSize: 25.0,
                  onPressed: (){},
              ),
              Text('Aprile 25 2020 - May 2 2020',
                style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,letterSpacing: 1),
              ),
              IconButton(icon:Icon(Icons.arrow_forward_ios),
                iconSize: 25.0,
                onPressed: (){},
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bar(label:'su',amountSpent:expenses[0],mostExpensive:mostExpensvie,),
              Bar(label:'mon',amountSpent:expenses[1],mostExpensive:mostExpensvie,),
              Bar(label:'tue',amountSpent:expenses[2],mostExpensive:mostExpensvie,),
              Bar(label:'wed',amountSpent:expenses[3],mostExpensive:mostExpensvie,),
              Bar(label:'thu',amountSpent:expenses[4],mostExpensive:mostExpensvie,),
              Bar(label:'fri',amountSpent:expenses[5],mostExpensive:mostExpensvie,),
              Bar(label:'sat',amountSpent:expenses[6],mostExpensive:mostExpensvie,),

            ],
          )
        ],
      );
  }


}
