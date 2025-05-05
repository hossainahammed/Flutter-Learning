import 'package:flutter/material.dart';
import 'Day_2.dart';
import 'Home.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First app',
        //home: Home()
        home: Day_2());
  }
}