import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'First app', home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        centerTitle: true,
        actions: [],
        backgroundColor: Colors.purple,
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("This is row ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.purple),),
            SizedBox(
              width: 10,
            ),
            Text("This is row ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.purple),),
            SizedBox(
              width: 10,
            ),
            Text("This is row ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.purple),),
            SizedBox(
              width: 10,
            ),
            Text("This is row ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.purple),),
            Text("This is row ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.purple),),
            Text("This is row ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.purple),),
            Text("This is row ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.purple),),
          ],
        ),
      )

    );
  }
}
