import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: Product.values.map((product) {
              return ProductCard(
                product: product,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

enum Product {
  dart,
  flutter,
  firebase,
}

extension ProductInfo on Product {
  String get title {
    switch (this) {
      case Product.dart:
        return "Dart";
      case Product.flutter:
        return "Flutter";
      case Product.firebase:
        return "Firebase";
    }
  }

  String get description {
    switch (this) {
      case Product.dart:
        return "The best object language";
      case Product.flutter:
        return "The best mobile UI library";
      case Product.firebase:
        return "The best Cloud database";
    }
  }

  String get imageAsset {
    switch (this) {
      case Product.dart:
        return 'assets/dart.png';
      case Product.flutter:
        return 'assets/flutter.png';
      case Product.firebase:
        return 'assets/firebase.png';
    }
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageAsset,
              height: 50,
              width: 50,
            ),
            SizedBox(height: 10),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
