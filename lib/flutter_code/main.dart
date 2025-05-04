import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyApp ());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'First app',
      home: Home(),

    );
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
        actions: [
           
        ],
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children:[
         Text("This is Column text",style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange,),),
         Text("This is Column text",style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange,),),
         Text("This is Column text",style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange,),),
         Text("This is Column text",style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange,),),
         Text("This is Column text",style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange,),),


       ],
      )
    );
  }
}

