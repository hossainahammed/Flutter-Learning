
import 'package:flutter/material.dart';

import 'Home.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Home()));
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button background color
                        foregroundColor: Colors.white, // Text/icon color
                      ),

                      child: Text('Home')),


                    SizedBox(
                      width: 20,
                    ),


                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Button background color
                          foregroundColor: Colors.white, // Text/icon color
                        ),

                        child: Text('Back')),

                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
