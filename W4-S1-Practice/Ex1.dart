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
          title: Text("My Hobbies"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch to full width
            children: [
              HobbyCard(
                title: "Travelling",
                icon: Icons.flight_takeoff,
                color: Colors.green,
              ),
              HobbyCard(
                title: "Skating",
                icon: Icons.directions_walk,
                color: Colors.blueGrey,
              ),
              // Add more HobbyCard widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}

// Part 2: Extracted HobbyCard Widget
class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  HobbyCard({
    required this.title,
    required this.icon,
    this.color = Colors.blue, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
