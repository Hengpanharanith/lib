import 'package:flutter/material.dart';
import 'package:your_project_name/Final-Exam/widgets/courses_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoursesView(),
    );
  }
}
