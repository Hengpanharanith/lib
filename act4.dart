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
          title: Text('Testing Gradiant Color in the box '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyButton(
                  "Nith", const Color.fromARGB(255, 248, 3, 3), Colors.white),
              MyButton("Panha", Colors.blue, Colors.red),
              MyButton("Heng", Colors.green, Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton(this.label, this.start, this.end, {super.key});

  final String label;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
