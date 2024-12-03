import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    //  Expense(
    //   title: 'Flutter Course',
    //   amount: 19.99,
    //   date: DateTime.now(),
    //   category: Category.work,
    // ),
    // Expense(
    //   title: 'Cinema',
    //   amount: 15.69,
    //   date: DateTime.now(),
    //   category: Category.leisure,
    // ),
  ];
  void _removeExpense(int index) {
    setState(() {
      _registeredExpenses.removeAt(index);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onSaveExpense: (title, amount, date, category) {
          setState(() {
            _registeredExpenses.add(Expense(
              title: title,
              amount: amount,
              date: DateTime.parse(date),
              category: category,
            ));
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _registeredExpenses.isEmpty
          ? Center(
              child: Text(
                "No expense found. Go to add somethings !",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          : ExpensesList(
              expenses: _registeredExpenses,
              onDismiss: (index) => _removeExpense(index),
            ),
    );
  }
}
