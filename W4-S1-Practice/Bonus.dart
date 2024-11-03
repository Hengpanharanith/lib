import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: WeatherColumn(),
      ),
    ),
  ));
}

class WeatherColumn extends StatelessWidget {
  const WeatherColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text(
            "Weekly Forecast",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              WeatherCard(
                date: "Monday",
                icon1: Icons.cloud,
                degree: "30°C",
                color: Colors.blueGrey,
              ),
              WeatherCard(
                date: "Tuesday",
                icon1: Icons.wb_sunny,
                degree: "20°C",
                color: Colors.orangeAccent,
              ),
              WeatherCard(
                date: "Wednesday",
                icon1: Icons.wb_sunny,
                degree: "10°C",
                color: Colors.yellowAccent,
              ),
              WeatherCard(
                date: "Thursday",
                icon1: Icons.cloud,
                degree: "14°C",
                color: Colors.blueGrey,
              ),
              WeatherCard(
                date: "Friday",
                icon1: Icons.ac_unit,
                degree: "40°C",
                color: Colors.lightBlue,
              ),
              WeatherCard(
                date: "Saturday",
                icon1: Icons.cloud,
                degree: "32°C",
                color: Colors.blueGrey,
              ),
              WeatherCard(
                date: "Sunday",
                icon1: Icons.wb_sunny,
                degree: "20°C",
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String date;
  final String degree;
  final IconData icon1;
  final Color color;

  const WeatherCard({
    required this.date,
    required this.degree,
    required this.icon1,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon1, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              date,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              degree,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
