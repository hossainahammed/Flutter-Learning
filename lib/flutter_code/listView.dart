
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
          return ListTile(
            leading: Icon(Icons.phone),
            trailing: Icon(Icons.delete),
            title: Text("0176095403 $index"),
          );
        },
         )

    );
  }
}
