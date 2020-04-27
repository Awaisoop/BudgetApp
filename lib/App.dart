import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileapp/pages/home_screen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
  
}