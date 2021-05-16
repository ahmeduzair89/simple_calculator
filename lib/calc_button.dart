import 'package:flutter/material.dart';

class CalcButton {

 static  calcButton(
    String buttonText,
    double buttonHeight,
    Color buttonColor,
    Function onTap,
    context,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        padding: EdgeInsets.all(16.00),
        onPressed:(){onTap(buttonText);},
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
}
