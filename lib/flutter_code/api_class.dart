import 'package:flutter/material.dart';

class api_class extends StatefulWidget {
  const api_class({super.key});

  @override
  State<api_class> createState() => _api_classState();
}

class _api_classState extends State<api_class> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
      ),
      body: ListView.builder(
          itemBuilder: context,index){
        return ListTile(
        title: Text('Hosain'),
    subtitle: Column(
    children: [
      Text('UserName',style: TextStyle(color: Colors.grey),),
      Text('UserName',style: TextStyle(color: Colors.grey),),
      Text('UserName',style: TextStyle(color: Colors.grey),),
      Text('UserName',style: TextStyle(color: Colors.grey),),
     Text('UserName',style: TextStyle(color: Colors.grey),),

    ],
    ),
        );

    },


    );
  }
}
