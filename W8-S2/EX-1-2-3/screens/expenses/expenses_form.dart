import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final Function(String title, double amount, String date, Category category)
      onSaveExpense;
  const ExpenseForm({super.key, required this.onSaveExpense});
  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String? _selectedDate;
  Category? _selectedCategory;

  void _onCategoryChanged(Category? newValue) {
    setState(() {
      _selectedCategory = newValue;
    });
  }

  Future<void> selecteDate() async {
    DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime(2029),
      initialDate: _selectedDate == null
          ? DateTime.now()
          : DateTime.parse(_selectedDate!),
    );
    setState(() {
      if (selected != null) {
        _selectedDate = DateFormat('yyyy-MM-dd').format(selected);
      }
    });
  }

  void _onCloseShowModal() {
    Navigator.pop(context);
  }

  void _saveExpense() {
    final title = _titleController.text;
    final amount = _amountController.text;
    final category = _selectedCategory;
    if (title.isEmpty || amount.isEmpty || category == null) {
      _showMyDialog();
      return;
    } else if (double.tryParse(amount)! < 0) {
      _showMyDialog1();
      return;
    } else if (_selectedDate == null) {
      _showMyDialog2();
      return;
    }
    widget.onSaveExpense(
        title, double.tryParse(amount) ?? 0, _selectedDate!, category);
    Navigator.pop(context);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid input'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('The title cannot be empty'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog1() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid input'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Amount should be positive'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid input'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Category Should not be empty'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
            decoration: InputDecoration(
              labelText: 'Title',
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _titleController.clear();
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    suffixIcon: IconButton(
                      onPressed: _amountController.clear,
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: IconButton(
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.date_range),
                      const SizedBox(width: 8),
                      Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : _selectedDate!,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  onPressed: selecteDate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: DropdownButton<Category>(
                  value: _selectedCategory,
                  hint: const Text('Category'),
                  isExpanded: true,
                  items: Category.values.map((category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Text(category.name),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: _onCategoryChanged,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: _onCloseShowModal,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(30, 30),
                    backgroundColor: Colors.transparent,
                    side: BorderSide.none,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: _saveExpense,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100,
                    minimumSize: const Size(100, 50),
                  ),
                  child: Text(
                    'Save Expense',
                    style: TextStyle(
                      color: Colors.purple.shade50,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
