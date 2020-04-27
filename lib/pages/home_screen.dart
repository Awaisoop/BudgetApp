import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileapp/Data/data.dart';
import 'package:profileapp/Models/category_model.dart';
import 'package:profileapp/Models/expense_model.dart';
import 'package:profileapp/pages/BarChart.dart';
import 'package:profileapp/pages/CategoryScreen.dart';
import 'package:profileapp/pages/color.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(Category category,double totalamountSpent){
    return GestureDetector(
      onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (_) => CategoryScreen(category:category))),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
        height: 100.0,
        width: double.infinity,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,2),
            blurRadius: 6.0,
          ),
        ]
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(category.name,
                style: TextStyle(fontSize: 15.0,
                fontWeight: FontWeight.w600
                ),
                ),
                Text('\$${(category.maxAmount - totalamountSpent).toStringAsFixed(2)}/ \$${category.maxAmount}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.0,
                  ),

                ),
              ],
            ),
            SizedBox(height: 10.0),
            LayoutBuilder(
              builder: (BuildContext context,BoxConstraints constraints){
                final double maxBarWidth = constraints.maxWidth;
                final double percent = (category.maxAmount - totalamountSpent)/ category.maxAmount;
             double barWidth = percent * maxBarWidth;
              if(barWidth < 0){
                barWidth =0;
              }

              return Stack(
                children: <Widget>[
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: barWidth,
                    decoration: BoxDecoration(
                      color: getColor(context,percent),
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                            ),



      ],
      );

  },
      ),
      ],
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
           // floating: true,
            pinned: true,
            expandedHeight: 85.0,
            leading: IconButton(icon:Icon(Icons.settings,),
                iconSize:30.0 ,
                onPressed: (){}),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Simple Budget'),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add),
                  iconSize:30.0 ,
                  onPressed: (){}
                  ),
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                      if(index == 0) {
                        return Container(
                          height: 320.0,
                          margin: EdgeInsets.fromLTRB(10, 20.0, 10.0, 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                // ignore: missing_return
                                blurRadius: 6.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: BarChart(weeklySpending),
                        );
                      }
                      else{
                       final Category category = categories[index - 1];
                       double totalamountSpent = 0;
                       category.expense.forEach((Expense expense){
                         totalamountSpent += expense.cost;
                       });
                       return _buildCategory(category,totalamountSpent);
                      }
          },
            childCount: 1 + categories.length,
          )),
        ],
      ),
    );
  }
}