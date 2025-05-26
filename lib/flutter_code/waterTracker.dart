import 'package:flutter/material.dart';

class waterTracker extends StatefulWidget {
  const waterTracker({super.key});

  @override
  State<waterTracker> createState() => _waterTrackerState();
}

class _waterTrackerState extends State<waterTracker> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
      title: Text('Water Tracke',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),),);

  }
}
