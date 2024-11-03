import 'package:flutter/material.dart';
import 'gradiant_widget.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             MyButton(23, 'Nith',Color(#F4C2C2), Color(#FFC1CC),Color(), textColor, end)
            ],  
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton(
      this.fontsize, this.label, this.start, this.mid, this.textColor, this.end,
      {super.key});

  final String label;
  final Color start;
  final Color end;
  final Color mid;
  final Color textColor;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, mid, end],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: fontsize),
      ),
    );
  }
}
