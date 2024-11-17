import 'package:flutter/material.dart';

class TemperatureConverter extends StatelessWidget {
  final VoidCallback onBackPressed;

  const TemperatureConverter({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thermostat_auto, size: 150, color: Colors.white),
          const SizedBox(height: 20),
          const Text(
            'Converter',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter a temperature',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onBackPressed, // Bind the button press to the callback
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromARGB(255, 23, 166, 255),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text('Back to Welcome'),
          ),
        ],
      ),
    );
  }
}
