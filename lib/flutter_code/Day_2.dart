import 'package:flutter/material.dart';

class Day_2 extends StatelessWidget {
  const Day_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal[300],//opacity apply
      backgroundColor: Colors.red.withOpacity(1),//opacity apply
      appBar: AppBar(
        title: Text("Day_2"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),

    );
  }
}
