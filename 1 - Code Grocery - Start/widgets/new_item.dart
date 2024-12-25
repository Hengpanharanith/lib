import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import '../models/grocery_category.dart';
import '../data/dummy_items.dart';

class NewItem extends StatefulWidget {
  const NewItem({
    super.key,
    required this.onSubmit,
    required this.mode,
    this.existingItem,
  });

  final Function(GroceryItem) onSubmit;
  final Mode mode;
  final GroceryItem? existingItem;

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  late String _itemName;
  late int _quantity;
  GroceryCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.editing && widget.existingItem != null) {
      _itemName = widget.existingItem!.name;
      _quantity = widget.existingItem!.quantity;
      _selectedCategory = widget.existingItem!.category;
    } else {
      _itemName = '';
      _quantity = 1;
      _selectedCategory = null;
    }
  }

  void _onAdd() {
    if (_formKey.currentState!.validate()) {
      final newItem = GroceryItem(
        name: _itemName,
        quantity: _quantity,
        category: _selectedCategory!,
      );
      widget.onSubmit(newItem);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.mode == Mode.editing ? 'Edit Item' : 'Add a New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _itemName,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length > 50) {
                    return 'Must be between 1 and 50 characters';
                  }
                  return null;
                },
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                onChanged: (value) {
                  _itemName = value;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _quantity.toString(),
                      validator: (value) {
                        final intValue = int.tryParse(value!);
                        if (intValue == null || intValue <= 0) {
                          return 'Must be a positive number';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(label: Text('Quantity')),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _quantity = int.tryParse(value) ?? 1;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _selectedCategory,
                      items: GroceryCategory.values
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      color: category.color,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(category.label),
                                  ],
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                      setState(() {
                        _itemName = '';
                        _quantity = 1;
                        _selectedCategory = null;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _onAdd,
                    child: Text(
                        widget.mode == Mode.editing ? 'Edit Item' : 'Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
