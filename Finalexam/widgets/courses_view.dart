// TODO
import 'package:flutter/material.dart';
import '../models/course.dart';
import 'course_view.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  final List<Course> courses = [
    Course('HTML', []),
    Course('JAVA', []),
    Course('Python', []),
  ];
  void addScore(String courseName, StudentScore score) {
    setState(() {
      final courseIndex = courses.indexWhere((c) => c.name == courseName);
      if (courseIndex != -1) {
        courses[courseIndex].scores.add(score);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCORE APP'),
        backgroundColor: const Color.fromARGB(255, 154, 205, 0),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(course.name),
              subtitle: Text(course.scores.isEmpty
                  ? 'No Student '
                  : '${course.scores.length} scores\nAverage: ${course.average.toStringAsFixed(1)}'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseView(
                    course: course,
                    onScoreAdded: (score) => addScore(course.name, score),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
