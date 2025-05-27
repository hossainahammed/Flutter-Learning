import 'package:flutter/material.dart';
import 'package:if_else_statement/flutter_code/stateful_class.dart';
import '../todo.dart';
import 'Day_2.dart';
import 'Home.dart';
import 'calculatorApp.dart';
import 'form_login.dart';
import 'main.dart';
import 'mediaQuery.dart';
import 'waterTracker.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First app',
        //home: Home()
        // home: Loginpage());
        // home: SateFullClass());
        // home: TodoApp());
        //home:MediaQury());
         //home:CalculatorApp());
         home:waterTracker());



  }
}