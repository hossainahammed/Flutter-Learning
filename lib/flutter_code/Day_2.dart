import 'package:flutter/material.dart';

class Day_2 extends StatelessWidget {
  const Day_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent[300],//opacity apply
     // backgroundColor: Colors.red.withOpacity(1),//opacity apply
      //backgroundColor: Colors.greenAccent.shade100,//opacity apply
      appBar: AppBar(
        title: Text("Day_2"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
        ),
                onPressed: () {
              print("Button Clicked");

            }, child: Text("Button")),
            OutlinedButton(onPressed: () {}, child: Text('Outlined button' )),
            GestureDetector(
              onTap: (){
                print("Text clicked");
              },
              child: Text("Gesture Detector Text "),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print(Text("Floating action button "));
      },
        child: Icon(Icons.abc_sharp),
        backgroundColor:Colors.cyan,
      ),

    );
  }
}
