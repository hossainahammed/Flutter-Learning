import 'package:flutter/material.dart';

class ApiWork extends StatefulWidget {
  const ApiWork({super.key});

  @override
  State<ApiWork> createState() => _ApiWorkState();
}

class _ApiWorkState extends State<ApiWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Crud'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
    );
  }
}
