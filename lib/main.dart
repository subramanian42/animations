//import 'package:animations/animations1.dart';
//import 'package:animations/animations1.dart';
//import 'package:animations/animations2.dart';
import 'package:animations/animations2.dart';
import 'package:animations/custom%20paint/temperature_control.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const TemperatureControl(),
    );
  }
}
