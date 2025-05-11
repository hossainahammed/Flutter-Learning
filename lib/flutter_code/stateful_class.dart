import 'package:flutter/material.dart';

class StatefulClass extends StatefulWidget {
  const StatefulClass({super.key});

  @override
  State<StatefulClass> createState() => _StatefulClassState();
}

class _StatefulClassState extends State<StatefulClass> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful class"),
        backgroundColor: Colors.deepPurpleAccent,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.toString(),
                style:TextStyle(
                  fontSize: 50,
                  color: Colors.deepPurpleAccent,
                  
                )
            ),
            SizedBox(
              height: 20,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        counter++;
                        print('Counter: $counter');

                      });


                    },style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
                      foregroundColor: Colors.white, // Text/icon color
                    ), child: Text("+",style: TextStyle(fontSize: 70,color: Colors.white),))),
                SizedBox(
                 width: 20,
                ),
                SizedBox(
                    width: 150,
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        counter--;
                        print('Counter: $counter');

                      });

                    }, style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
                      foregroundColor: Colors.white, // Text/icon color
                    ),
                        child: Text("-",style: TextStyle(fontSize: 70,color: Colors.white),))),
              ],
            )

          ],
        ),
      ),
    );
  }
}
