import 'package:flutter/material.dart';
import 'package:if_else_statement/flutter_code/stateful_class.dart';
import '../todo.dart';
import 'API_WOrk.dart';
import 'Day_2.dart';
import 'Expense Tracker.dart';
import 'Home.dart';
import 'TO_DO _APP.dart';
import 'api_class.dart';
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
        title: 'TODO app',
        //home: Home()
        // home: Loginpage());
        // home: SateFullClass());
        // home: TodoApp());
        //home:MediaQury());
         //home:CalculatorApp());
         //home:waterTracker());
        // home:Expense_Tracker());
        // home:TdoScreen());
        // home:ApiClass());
          home:ApiWork();






  }
}