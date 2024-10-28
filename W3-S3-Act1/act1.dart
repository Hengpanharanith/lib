import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Heng Panharanith",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    ),
  );
}
