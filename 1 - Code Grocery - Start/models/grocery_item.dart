import 'grocery_category.dart';

class GroceryItem {
  const GroceryItem({
    required this.name,
    required this.quantity,
    required this.category,
  });

  final String name;
  final int quantity;
  final GroceryCategory category;
}

enum Mode { editing, creating, normal, selection }
