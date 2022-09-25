import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/calculator_provider.dart';

class CalButton extends StatelessWidget {
  String? text;

  CalButton(this.text);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculatorProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        if (text == "=") {
          provider.result();
        } else if (text == "AC") {
          provider.setFinalResult(0.0);
          provider.setText(t: " ");
        } else if (text == "C") {
          provider.backspace();
        } else {
          provider.setText(t: text);
        }
      },
      child: Container(
        margin: EdgeInsets.all(6.0),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Text(
          text!,
          style: TextStyle(color: Colors.white, fontSize: 26.0),
        ),
      ),
    );
  }
}
