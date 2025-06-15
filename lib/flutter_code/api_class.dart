import 'package:flutter/material.dart';

class ApiClass extends StatefulWidget {
  const ApiClass({super.key});

  @override
  State<ApiClass> createState() => _ApiClassState();
}

class _ApiClassState extends State<ApiClass> {
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
            title: Text('Hossain'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // optional
              children: const [
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
