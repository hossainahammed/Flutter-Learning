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
  bool isloading = false;



  Future<void> fatchUsers()async {
    setState(() {
      isloading = true;
    });
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers:{
        'Accept' : 'application/json'
        }
    );


    setState(() {
      isloading = false;
    });
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
      body: isloading ? Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: users.length, // Required: how many items in the list
        itemBuilder: (context, index) {
          final user =users[index];
          return ListTile(
            leading:CircleAvatar(
              backgroundColor:Colors.deepPurpleAccent,
              child:Text(user['name'][0],style:TextStyle(color:Colors.white,fontSize:28),),
            ),
            title: Text(user['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // optional
              children:  [
                SizedBox(height:11,),
                Text('UserName :${user['username']}', style: TextStyle(color: Colors.grey)),
                Text('Email: ${user['email']}', style: TextStyle(color: Colors.grey)),
                Text('Phone:${user['phone']}', style: TextStyle(color: Colors.grey)),
                Text('Website: ${user['website']}', style: TextStyle(color: Colors.grey)),
                Text('Adress : ${user['address']['street']} ${user['address']['city']}', style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}
