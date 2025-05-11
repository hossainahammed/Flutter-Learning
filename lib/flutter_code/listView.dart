
import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 50,
            color: Colors.red,
          ),
          Container(
            height: 200,
            width: 50,
            color: Colors.blue,
          ),
          Container(
            height: 200,
            width: 50,
            color: Colors.green,
          ),
          Container(
            height: 200,
            width: 50,
            color: Colors.deepPurpleAccent,
          ),
          Container(
            height: 200,
            width: 50,
            color: Colors.purple,
          ),
          Container(
            height: 200,
            width: 50,
            color: Colors.blue,
          ),
          Container(
            height: 200,
            width: 50,
            color: Colors.pinkAccent,
          ),
          Container(
            height: 200,
            width: 50,
            color: Colors.orange,
          ),Container(
            height: 200,
            width: 50,
            color: Colors.yellow,
          ),Container(
            height: 200,
            width: 50,
            color: Colors.blue,
          ),



        ],
      ),
    );
  }
}
