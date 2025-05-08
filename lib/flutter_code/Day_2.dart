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
              child: Text("Gesture Detector Text ")
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              softWrap: true,
             // maxLines: 5,
              overflow: TextOverflow.ellipsis,
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 60),
              padding: EdgeInsets.all(5),
              width: 200,
              height: 200,
             // color:Colors.blue,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.redAccent,

                ),
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(5, 4),
                  blurRadius: 15,
                )]

              ),
              child: Center(
                child: Column(
                  children: [
                    Text("This is container",
                      style: TextStyle(fontSize: 20,
                      color: Colors.white,),),
                    Text("This is container",
                      style: TextStyle(fontSize: 20,
                        color: Colors.white,),),
                    Text("This is container",
                      style: TextStyle(fontSize: 20,
                        color: Colors.white,),),

                  ],
                ),
              ),

            )


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print(Text("Floating action button "));
      },
        child: Icon(Icons.add),
        backgroundColor:Colors.cyan,
      ),

    );
  }
}
