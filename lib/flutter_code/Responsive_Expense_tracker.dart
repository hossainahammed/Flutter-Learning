import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Expense_modal.dart';
import 'widget/ExpensePieChart.dart';

class ResponsiveExpenseTracker extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const ResponsiveExpenseTracker({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<ResponsiveExpenseTracker> createState() => _ResponsiveExpenseTrackerState();
}

class _ResponsiveExpenseTrackerState extends State<ResponsiveExpenseTracker> {
  final List<String> categories = ['Food', 'Transport', 'Entertainment', 'Bills','Shopping','Exetra'];
  final List<Expense> _expense = [];

  String _currency = '৳';
  double _budgetLimit = 2000.0;
  double totall = 0.0;
  String _selectedFilter = 'All';
  String _selectedSort = 'Newest';

  void _showForm({Expense? existingExpense, int? index}) {
    String selectedCategory = existingExpense?.category ?? categories.first;
    TextEditingController titleController = TextEditingController(text: existingExpense?.title ?? '');
    TextEditingController amountController = TextEditingController(
        text: existingExpense != null ? existingExpense.amount.toString() : '');
    DateTime expenseDateTime = existingExpense?.date ?? DateTime.now();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 15),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField(
                value: selectedCategory,
                items: categories
                    .map((category) => DropdownMenuItem(value: category, child: Text(category)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) selectedCategory = value;
                },
                decoration: InputDecoration(labelText: 'Select Category'),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        double.tryParse(amountController.text) != null) {
                      if (existingExpense != null && index != null) {
                        _editExpense(index, titleController.text, double.parse(amountController.text),
                            expenseDateTime, selectedCategory);
                      } else {
                        _addExpense(titleController.text, double.parse(amountController.text),
                            expenseDateTime, selectedCategory);
                      }
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    existingExpense != null ? "Update Expense" : "Add Expense",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void _setBudgetLimit() {
    TextEditingController budgetController = TextEditingController(text: _budgetLimit.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Set Budget Limit"),
          content: TextField(
            controller: budgetController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Budget Limit'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                double? newLimit = double.tryParse(budgetController.text);
                if (newLimit != null) {
                  setState(() {
                    _budgetLimit = newLimit;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text("Set"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _addExpense(String title, double amount, DateTime date, String category) {
    setState(() {
      _expense.add(Expense(title: title, amount: amount, date: date, category: category));
      totall += amount;
    });
  }

  void _editExpense(int index, String title, double amount, DateTime date, String category) {
    setState(() {
      totall -= _expense[index].amount;
      _expense[index] = Expense(title: title, amount: amount, date: date, category: category);
      totall += amount;
    });
  }

  void _deleteExpense(int index) {
    setState(() {
      totall -= _expense[index].amount;
      _expense.removeAt(index);
    });
  }

  List<Expense> get _filteredExpenses {
    List<Expense> filtered = _selectedFilter == 'All'
        ? _expense
        : _expense.where((e) => e.category == _selectedFilter).toList();

    if (_selectedSort == 'Newest') {
      filtered.sort((a, b) => b.date.compareTo(a.date));
    } else {
      filtered.sort((a, b) => a.amount.compareTo(b.amount));
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFE0F7FA),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Track Your  Expenses"),
        actions: [
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: _setBudgetLimit, // Call the method to set budget limit
          ),
          DropdownButton<String>(
            value: _currency,
            items: ['৳', '\$', '€', '₹']
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _currency = value);
            },
          ),
          Switch(
            value: widget.isDarkMode,
            onChanged: widget.onThemeChanged,
            activeColor: Colors.white,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showForm,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (totall > _budgetLimit)
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.warning, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Budget Limit Exceeded!",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: _selectedFilter,
                  items: ['All', ...categories]
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _selectedFilter = value);
                  },
                ),
                DropdownButton<String>(
                  value: _selectedSort,
                  items: ['Newest', 'Amount']
                      .map((c) => DropdownMenuItem(value: c, child: Text("Sort by $c")))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => _selectedSort = value);
                  },
                ),
              ],
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(8.0),
              child: _expense.isEmpty
                  ? Center(child: Text("No data to show in pie chart."))
                  : ExpensePieChart(expenses: _expense,currency: _currency),
            ),
            Card(
              color: Colors.orangeAccent,
              margin: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Total: $_currency$totall',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredExpenses.length,
                itemBuilder: (context, index) {
                  final e = _filteredExpenses[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text(e.category[0]),
                      ),
                      title: Text(e.title),
                      subtitle: Text('${DateFormat.yMMMd().format(e.date)} | $_currency${e.amount}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _showForm(existingExpense: e, index: index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteExpense(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
