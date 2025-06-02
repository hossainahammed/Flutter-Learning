import 'package:flutter/material.dart';

class TdoScreen extends StatefulWidget {
  const TdoScreen({super.key});

  @override
  State<TdoScreen> createState() => _TdoScreenState();
}

class _TdoScreenState extends State<TdoScreen> {

  void _showTaskDialouge({int ? index}){
    TextEditingController _taskController = TextEditingController();

    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Add Task'),
      content: TextField(
        controller: _taskController,
        decoration: InputDecoration(
          hintText: 'Enter Task'
        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Cancel')),

        ElevatedButton(style:ElevatedButton.styleFrom(
        shape: StadiumBorder()
        ),onPressed: (){}, child: Text('Save')),
      ],

    ));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Todo app'),
      ),

      body: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Text('10',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text('Active', style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Text('10',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text('Completed', style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],

                    ),
                  ),
                ),
              )
            ],
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>_showTaskDialouge(),
        child: Icon(Icons.add),),
    );
  }
}
