import 'package:flutter/material.dart';

class Expense_Tracker extends StatefulWidget {
  const Expense_Tracker({super.key});

  @override
  State<Expense_Tracker> createState() => _Expense_TrackerState();
}

class _Expense_TrackerState extends State<Expense_Tracker> {

  final List<String> categories=[
    'Food',
    'Transport',
    'Enter',
    'Bills'
  ];

  double totall = 0.0;

  void _showForm(){
    String selectedCategory  = categories.first;
    showModalBottomSheet(context: context, builder:(context){
      return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(

              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount'
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DropdownButtonFormField(items: categories.map((category) => DropdownMenuItem(value: category,child: Text(category),)).toList(),
                onChanged: (value) => selectedCategory = value!,
            decoration: InputDecoration(labelText: 'Select any one'),),
            SizedBox(
              height: 20,
            ),

            SizedBox(
                width:double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text("Add Expense")))


          ],
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: ()=>_showForm(), icon: Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),

              ),
            )
           // Text('Total: $total')
          ],
        ),
      ),
    );
  }
}
