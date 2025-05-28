import 'package:flutter/material.dart';

class waterTracker extends StatefulWidget {
  const waterTracker({super.key});

  @override
  State<waterTracker> createState() => _waterTrackerState();
}

class _waterTrackerState extends State<waterTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(
          'Water Tracker App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Today's in Tank",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2000 ml',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: 0.2,
                    backgroundColor: Colors.grey,
                    color: Colors.blueAccent,
                    strokeWidth: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              children: [
                ElevatedButton.icon(onPressed:(){},
                    label: Text('+200 ml ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),),
                  icon:Icon(Icons.water_drop),
                )
              ],
              

            ),
          ],
        ),
      ),
    );
  }
}
