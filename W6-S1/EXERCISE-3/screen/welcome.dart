import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final VoidCallback onStartPressed;

  const Welcome({super.key, required this.onStartPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thermostat, size: 150, color: Colors.white),
          const SizedBox(height: 20),
          const Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onStartPressed, // Bind the button press to the callback
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromARGB(255, 23, 166, 255),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text('Start to Convert'),
          ),
        ],
      ),
    );
  }
}
