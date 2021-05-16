import 'package:ahmed_simple_calc/calculator_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHome(),
    );
  }
}
