import 'package:flutter/material.dart';

class Day_3 extends StatefulWidget {
  const Day_3({super.key});

  @override
  State<Day_3> createState() => _Day_3State();
}

class _Day_3State extends State<Day_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is extra widget'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Column(
              children: [
                CircleAvatar(
                  radius :35,
                  backgroundImage: NetworkImage('url'),
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Hossain Ahammed',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 18),),
                Text('hossain@gmail.com',style: TextStyle(fontSize: 14),)
              ],
            )),

            ListTile(
              title: Text('Home'),
              onTap: (){},
            ),

            Divider(
              thickness: 1,
              color: Colors.blueGrey,
            ),


            ListTile(
              title: Text('Item-1'),
              onTap: (){},
            ),

            Divider(
              thickness: 1,
              color: Colors.blueGrey,
            ),


            ListTile(
              title: Text('Item-2'),
              onTap: (){},
            ),
            Divider(
              thickness: 1,
              color: Colors.blueGrey,
            ),



            ListTile(
              title: Text('Item-3'),
              onTap: (){},
            ),
          ],
        ),


      ),

    );
  }
}
