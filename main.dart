import 'package:flutter/material.dart';
// Adjust the path if needed
import './screens/Location_picker/location_picker.dart'; // Adjust the theme import if necessary

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Location Picker Test',
      theme: ThemeData(
          primarySwatch:
              Colors.blue), // Replace with BlaColors.primary if required
      home: const LocationPickerScreen(
        title: 'Pick a Location',
        // Optionally, you can pass an excludeLocation if needed:
        // excludeLocation: someLocation, // Define this if you need to exclude a specific location
      ),
    );
  }
}
