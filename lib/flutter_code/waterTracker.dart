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
      title: Text('Water Tracke',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Text("Today's in Tank",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox( height: 10,),
                  Text('2000 ml',
                    style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  ),
                ],

              ),
            )
          ],
        ),
      ),
    );

  }
}
