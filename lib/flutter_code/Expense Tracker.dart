import 'package:flutter/material.dart';

import 'Expense_modal.dart';

class Expense_Tracker extends StatefulWidget {
  const Expense_Tracker({super.key});

  @override
  State<Expense_Tracker> createState() => _Expense_TrackerState();
}

class _Expense_TrackerState extends State<Expense_Tracker> {

  final List<String> categories=[
    'Food',
    'Transport',
    'Entertainment',
    'Bills'
  ];

  final List<Expense> _expense = [];

  double totall = 0.0;

  void _showForm(){
    String selectedCategory  = categories.first;
    TextEditingController titleControlller = TextEditingController();
    TextEditingController amountControlller = TextEditingController();
    DateTime expenseDateTime =DateTime.now();
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
              controller: titleControlller,
              decoration: InputDecoration(
                labelText:'Title'

              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller:amountControlller ,
              keyboardType:TextInputType.number,
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
                child: ElevatedButton(onPressed: (){
                  //if(titleControlller.text.isNotEmpty || double.tryParse(amountControlller.text)!=null){
                    _adExpense(titleControlller.text,double.parse(amountControlller.text),expenseDateTime,selectedCategory);
                    Navigator.pop(context);

                  //}

                },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text("Add Expense",style:TextStyle(color: Colors.white),))
            ),
            SizedBox(height: 10,),

          ],
        ),
      );
    });
  }

  void _adExpense(String title,double amount,DateTime date,String category){
    setState(() {
      _expense.add(Expense(title: title, amount: amount, date: date, category: category));
      totall +=amount;
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
                color: Colors.orangeAccent,
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(padding: const EdgeInsets.all(50.0),
                child: Text('Total:৳$totall',
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _expense.length,
                  itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(_expense[index].category),

                    ),
                    title: Text(_expense[index].title),

                  ),
                );

              }),
            )
          ],
        ),
      ),
    );
  }
}
