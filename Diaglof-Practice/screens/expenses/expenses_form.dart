import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs

    String title = _titleController.text;
    String amount = _valueController.text;
    double? value = double.tryParse(amount) ?? 0;

    //add dialog

    if (title.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text('Please enter a valid title'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'))
                ],
              ));
      return;
    } else if (amount.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text('Please enter amount'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'))
                ],
              ));
    } else if (value.isNegative) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text('Please enter amount'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'))
                ],
              ));
    } else {
      // 2- Create the expense
      Expense expense = Expense(
          title: title,
          amount: amount,
          date: DateTime.now(), //  TODO :  For now it s a fake data
          category: Category.food); //  TODO :  For now it s a fake data

      // 3- Ask the parent to add the expense
      widget.onCreated(expense);

      // 4- Close modal
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly,
            // ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          )
        ],
      ),
    );
  }
}
