import 'package:flutter/material.dart';

class TdoScreen extends StatefulWidget {
  const TdoScreen({super.key});

  @override
  State<TdoScreen> createState() => _TdoScreenState();
}

class _TdoScreenState extends State<TdoScreen> {
  List<Map<String, dynamic>> tasks = [];
  bool showActiveTask = true;

  void _addTask(String task) {
    setState(() {
      tasks.add({'task': task, 'completed': false});
      Navigator.pop(context);
    });
  }

  void editTask(int index,String updateTask) {
    setState(() {
     tasks[index]['task'] = updateTask;
    });
  }

  void _showTaskDialouge({int? index}) {
    TextEditingController _taskController = TextEditingController(

      text: index!=null ? tasks[index]['task']: ''
    );



    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(index != null ? 'Edit Task' : 'Add Task'),
            content: TextField(
              controller: _taskController,
              decoration: InputDecoration(hintText: 'Enter Tasks'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancell'),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                onPressed: () {
                  if (_taskController.text.trim().isNotEmpty) {
                    if (index != null){
                      editTask(index, _taskController.text);

                    }
                    else{
                      _addTask(_taskController.text);

                    }

                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  int get activeCount => tasks.where((task) => !task['completed']).length;
  int get completedCount => tasks.where((task) => task['completed']).length;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filterdTasks =
        tasks.where((task) => task['completed'] != showActiveTask).toList();
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(title: Text('Todo app')),

      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    showActiveTask = true;
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            activeCount.toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Active',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showActiveTask = false;
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            completedCount.toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Completed',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterdTasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(UniqueKey().toString()),
                  background: Container(
                    color: Colors.green,
                    child: Icon(Icons.check_box, color: Colors.white),
                  ),

                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      // Task complete
                      toggleTaskStatus(index);
                    } else {
                      //delete task
                      deleteTask(index);
                    }
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        filterdTasks[index]['task'],
                        style: TextStyle(
                          fontSize: 16,
                          decoration:
                              filterdTasks[index]['completed']
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),

                      leading: Checkbox(
                        shape: CircleBorder(),
                        value: filterdTasks[index]['completed'],
                        onChanged: (value) => toggleTaskStatus(index),
                      ),
                      trailing: IconButton(onPressed: ()=>_showTaskDialouge(index: index), icon: Icon(Icons.edit)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialouge(),
        child: Icon(Icons.add),
      ),
    );
  }
}
