import 'package:flutter/material.dart';
import 'package:your_project_name/screens/ride_pref/ride_pref_screen.dart';
import 'package:your_project_name/screens/testscreen/testbutton.dart';
import 'package:your_project_name/screens/ride_pref/widgets/ride_pref_form.dart';
import 'package:your_project_name/theme/theme.dart';

 // Adjust the import path if needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlaButton Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RidePrefScreen(),
    );
  }
}
