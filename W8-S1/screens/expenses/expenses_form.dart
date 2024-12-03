import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController1 = TextEditingController();

  final _titleController2 = TextEditingController();

  @override
  void dispose() {
    _titleController1.dispose();
    _titleController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController1,
            keyboardType: TextInputType.number,
            
            decoration: const InputDecoration(
              label: Text('Title1'),
            ),
          ),
          TextField(
            controller: _titleController2,
            decoration: const InputDecoration(
              label: Text('Title2'),
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    print(_titleController1.text),
                    print(_titleController2.text)
                  },
              child: const Text('Check value'))
        ],
      ),
    );
  }
}
