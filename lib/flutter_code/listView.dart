
import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context,index){
          return Text('Item $index',style: TextStyle(
            fontSize: 20,
            color: Colors.red
          ),);
        },
         )

    );
  }
}
