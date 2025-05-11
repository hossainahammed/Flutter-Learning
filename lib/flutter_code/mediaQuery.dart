import 'package:flutter/material.dart';

class MediaQury extends StatefulWidget {
  const MediaQury({super.key});

  @override
  State<MediaQury> createState() => _MediaQuryState();
}

class _MediaQuryState extends State<MediaQury> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: screenSize.width*0.2,
              height: screenSize.height*0.3,
              color: Colors.red,
            ),
          )
        ],
      ),

    );
  }
}
