import 'package:flutter/material.dart';
import 'screen/welcome.dart';
import 'screen/temperature.dart';

void main() {
  runApp(const TemperatureApp());
}

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool _isWelcomeScreen = true;

  // Callback function to change the state
  void _changeScreen() {
    setState(() {
      _isWelcomeScreen = !_isWelcomeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 23, 166, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Conditionally render the Welcome or TemperatureConverter screen
          child: _isWelcomeScreen
              ? Welcome(onStartPressed: _changeScreen)
              : TemperatureConverter(onBackPressed: _changeScreen),
        ),
      ),
    );
  }
}
