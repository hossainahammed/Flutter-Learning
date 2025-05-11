import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                 Expanded(child: TextField(
                   decoration: InputDecoration(
                     labelText: 'Enter Task',
                     border: OutlineInputBorder()
                   ),
                 )),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){}, child: Text('ADd'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
