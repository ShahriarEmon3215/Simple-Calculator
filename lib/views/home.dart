import 'package:calculator/controller/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin:
                      EdgeInsets.only(top: 25, left: 5, right: 5, bottom: 5),
                  height: double.infinity,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //   border: Border.all(width: 1, color: Colors.white),
                  //   borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  //   color: Colors.black,
                  // ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<CalculatorProvider>(
                          builder: (_, val, child) {
                            return Text(
                              val.getText!,
                              style: TextStyle(
                                  color: Colors.amberAccent, fontSize: 28),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Consumer<CalculatorProvider>(
                              builder: (_, val, child) {
                                return Flexible(
                                  child: Text(
                                    val.getFinalResult!,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: CalButton("AC")),
                              Flexible(flex: 1, child: CalButton("C")),
                              Flexible(flex: 1, child: CalButton("%")),
                              Flexible(flex: 1, child: CalButton("\u00F7"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: CalButton("7")),
                              Flexible(flex: 1, child: CalButton("8")),
                              Flexible(flex: 1, child: CalButton("9")),
                              Flexible(flex: 1, child: CalButton("*"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: CalButton("4")),
                              Flexible(flex: 1, child: CalButton("5")),
                              Flexible(flex: 1, child: CalButton("6")),
                              Flexible(flex: 1, child: CalButton("-"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: CalButton("1")),
                              Flexible(flex: 1, child: CalButton("2")),
                              Flexible(flex: 1, child: CalButton("3")),
                              Flexible(flex: 1, child: CalButton("+"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 2, child: CalButton("0")),
                              Flexible(flex: 1, child: CalButton(".")),
                              Flexible(flex: 1, child: CalButton("=")),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
