import 'package:flutter/material.dart';

class TdoScreen extends StatefulWidget {
  const TdoScreen({super.key});

  @override
  State<TdoScreen> createState() => _TdoScreenState();
}

class _TdoScreenState extends State<TdoScreen> {

  List<Map<String,dynamic>> tasks =[];
  bool showActiveTask = true;

  void _addTask(String task){
    setState(() {
      tasks.add(
        {
          'task' :task,
          'completed' : false,
        }

      );
      Navigator.pop(context);
    });
  }
  

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
        ),onPressed: (){
          if(_taskController.text.trim().isNotEmpty){
            _addTask(_taskController.text);
          }
        }, child: Text('Save')),
      ],

    ));

  }
  
  int get activeCount => tasks.where((task)=>!task['completed']).length;
  int get completedCount => tasks.where((task)=>task['completed']).length;
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
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index]['task']),
                    ),

                  );
            }),
          )


        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>_showTaskDialouge(),
        child: Icon(Icons.add),),
    );
  }
}
