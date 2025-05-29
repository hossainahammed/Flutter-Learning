import 'package:flutter/material.dart';

import 'widget/add_water_Button.dart';

class waterTracker extends StatefulWidget {

  const waterTracker({super.key});

  @override
  State<waterTracker> createState() => _waterTrackerState();
}

class _waterTrackerState extends State<waterTracker> {

  int currentInTake = 0;
  final int goal = 2000;

  void waterAdd(int amount){
    setState(() {
      currentInTake = (currentInTake+ amount).clamp(0, goal);
    });
  }

  void resetWater(){
    setState(() {
      currentInTake=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentInTake/goal).clamp(0.0, 1.0);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            'Water Tracker App',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
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
                    '$currentInTake Liter',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value:progress,
                    backgroundColor: Colors.grey,
                    color: Colors.blueAccent,
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  '${(progress*100).toInt()}%', // Display the percentage of water consumed
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 20,
              children: [
                add_water_Button(amount: 200,icon:Icons.local_drink , onClick: ()=>waterAdd(200),),
                add_water_Button(amount: 500,icon:Icons.local_drink , onClick:  ()=>waterAdd(500),),
                add_water_Button(amount: 1000,icon:Icons.local_drink , onClick:  ()=>waterAdd(1000)),
              ],
            ),




            SizedBox(height: 40,),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(onPressed: ()=>resetWater(),style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,), child: Text('Reset',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}


