import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Button'),
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewWidget(
                color: Color.fromARGB(255, 54, 160, 247),
                text: "Submit",
                icon1: Icons.check,
                fontcolor: Colors.purple,
                iconcolor: Colors.purple,
                iconPosition: IconPosition.left,
              ),
              SizedBox(height: 10),
              NewWidget(
                color: Colors.green,
                text: "Time",
                icon1: Icons.access_time,
                fontcolor: Colors.purple,
                iconcolor: Colors.purple,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 10),
              NewWidget(
                color: Color.fromARGB(255, 221, 221, 221),
                text: "Account",
                icon1: Icons.account_tree,
                fontcolor: Color.fromARGB(255, 184, 184, 184),
                iconcolor: Color.fromARGB(255, 181, 179, 179),
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

enum IconPosition { left, right }

class NewWidget extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon1;
  final Color fontcolor;
  final Color iconcolor;
  final IconPosition iconPosition;

  const NewWidget({
    super.key,
    required this.color,
    required this.text,
    required this.icon1,
    required this.fontcolor,
    required this.iconcolor,
    required this.iconPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: iconPosition == IconPosition.left
              ? [
                  Icon(icon1, color: iconcolor),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      color: fontcolor,
                      fontSize: 20,
                    ),
                  ),
                ]
              : [
                  Text(
                    text,
                    style: TextStyle(
                      color: fontcolor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(icon1, color: iconcolor),
                ],
        ),
      ),
    );
  }
}
