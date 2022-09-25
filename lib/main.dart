import 'package:calculator/controller/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
      create: (ctx) => CalculatorProvider(),
      child: Calculator(),
    ),
  ));
}

