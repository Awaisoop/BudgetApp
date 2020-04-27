import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileapp/Models/category_model.dart';
import 'package:profileapp/Models/expense_model.dart';
import 'package:profileapp/pages/color.dart';
import 'package:profileapp/pages/radial_painter.dart';

class CategoryScreen extends StatefulWidget{
  final Category category;
  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpenses(){
    List<Widget> expenseList = [];
    widget.category.expense.forEach((Expense expense){
      expenseList.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        height: 70.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0,2),
              blurRadius: 6.0,
            ),
          ],
        ),child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              expense.name,
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
            ),
            Text('-\$${expense.cost.toStringAsFixed(2)}',
            style: TextStyle(color: Colors.red,
            fontSize: 18.0,
              fontWeight: FontWeight.w600
            ),
            )
          ],
      ),
        ),
      ));
    });
    return Column(
      children:expenseList,
    );
  }
  @override
  Widget build(BuildContext context) {
    double totalamountSpent = 0;
    widget.category.expense.forEach((Expense expense){
      totalamountSpent += expense.cost;
    });
    final  double amountLeft = widget.category.maxAmount - totalamountSpent;
    final double percent = amountLeft / widget.category.maxAmount;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
              onPressed:(){})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset:  Offset(0,2),
                    blurRadius: 6.0,
                  )
                ]

              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(bgColor: Colors.grey[200],
                lineColor: getColor(context, percent),
                  percent: percent,
                  width: 10,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)}/ \$${widget.category.maxAmount}',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }
}