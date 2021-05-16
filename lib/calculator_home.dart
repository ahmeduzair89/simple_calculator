
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equFontsize = 38.0;
  double resultFontsize = 48.0;
  CalcButton _calc;
  onTap(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equFontsize = 38.0;
        resultFontsize = 48.0;
      } else if (buttonText == "⌫") {
        equFontsize = 48.0;
        resultFontsize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") equation = "0";
      } else if (buttonText == "=") {
        equFontsize = 38.0;
        resultFontsize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equFontsize = 48.0;
        resultFontsize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    buttonPressed(String buttonText) {
      setState(() {
        if (buttonText == "C") {
          equation = "0";
          result = "0";
          equFontsize = 38.0;
          resultFontsize = 48.0;
        } else if (buttonText == "⌫") {
          equFontsize = 48.0;
          resultFontsize = 38.0;
          equation = equation.substring(0, equation.length - 1);
          if (equation == "") equation = "0";
        } else if (buttonText == "=") {
          equFontsize = 38.0;
          resultFontsize = 48.0;

          expression = equation;
          expression = expression.replaceAll('×', '*');
          expression = expression.replaceAll('÷', '/');

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            result = "Error";
          }
        } else {
          equFontsize = 48.0;
          resultFontsize = 38.0;
          if (equation == "0") {
            equation = buttonText;
          } else {
            equation = equation + buttonText;
          }
        }
      });
    }

    Widget createButton(
        String buttonText, double buttonHeight, Color buttonColor) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
        color: buttonColor,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
          padding: EdgeInsets.all(16.00),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text('Simple Calculator, Made by AHMED (10347)',style: TextStyle(color: Colors.black,fontSize: 16),),
              
            ),
            body: Column(children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  equation,
                  style: TextStyle(fontSize: equFontsize),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: resultFontsize),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Table(children: [
                      TableRow(children: [
                        createButton("C", 1, Colors.black),
                        createButton("⌫", 1, Colors.grey),
                        createButton("÷", 1, Colors.grey),
                      ]),
                      TableRow(children: [
                        createButton("7", 1, Colors.green),
                        createButton("8", 1, Colors.green),
                        createButton("9", 1, Colors.green),
                      ]),
                      TableRow(children: [
                        createButton("4", 1, Colors.green),
                        createButton("5", 1, Colors.green),
                        createButton("6", 1, Colors.green),
                      ]),
                      TableRow(children: [
                        createButton("1", 1, Colors.green),
                        createButton("2", 1, Colors.green),
                        createButton("3", 1, Colors.green),
                      ]),
                      TableRow(children: [
                        createButton(".", 1, Colors.green),
                        createButton("0", 1, Colors.green),
                        createButton("00", 1, Colors.green),
                      ])
                    ]),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Table(children: [
                        TableRow(children: [
                          createButton("×", 1, Colors.grey),
                        ]),
                        TableRow(children: [
                          createButton("-", 1, Colors.grey),
                        ]),
                        TableRow(children: [
                          createButton("+", 1, Colors.grey),
                        ]),
                        TableRow(children: [
                          createButton("=", 2, Colors.red),
                        ])
                      ]))
                ],
              )
            ])));
  }
}
