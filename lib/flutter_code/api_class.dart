import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
class ApiClass extends StatefulWidget {
  const ApiClass({super.key});

  @override
  State<ApiClass> createState() => _ApiClassState();
}

class _ApiClassState extends State<ApiClass> {

  List users = [];

  Future<void> fatchUsers()async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode== 200){
      users=jsonDecode(response.body);
    }
    else{
      throw Exception("Something Wrong");
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
      ),
      body: ListView.builder(
        itemCount: 10, // Required: how many items in the list
        itemBuilder: (context, index) {
          return ListTile(
            leading:CircleAvatar(
              backgroundColor:Colors.deepPurpleAccent,
              child:Text('s',style:TextStyle(color:Colors.white,fontSize:28),),
            ),
            title: Text('Hossain'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // optional
              children: const [
                SizedBox(height:10,),
                Text('UserName', style: TextStyle(color: Colors.grey)),
                Text('UserName', style: TextStyle(color: Colors.grey)),
                Text('UserName', style: TextStyle(color: Colors.grey)),
                Text('UserName', style: TextStyle(color: Colors.grey)),
                Text('UserName', style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}
