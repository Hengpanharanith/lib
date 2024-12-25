import 'package:flutter/material.dart';
import '../models/course.dart';
import '../models/student.dart';
import 'course_view.dart';
import 'score_form.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  _CoursesViewState createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  List<Course> courses = [];
  Map<String, List<Student>> courseStudents = {};

  @override
  void initState() {
    super.initState();
//Display the HTML and Java Course and Count the student for each course+
    
    // courseStudents = {
    //   'Course 1': [
    //     Student(name: 'Student 1', score: 85.5),
    //     Student(name: 'Student 2', score: 90.0),
    //     // Add more students as needed
    //   ],
    //   'Course 2': [
    //     Student(name: 'Student 3', score: 88.0),
    //     Student(name: 'Student 4', score: 92.0),
    //     // Add more students as needed
    //   ],
    // };
  }

  void _updateCourseData(String courseTitle, List<Student> students) {
    setState(() {
      final courseIndex =
          courses.indexWhere((course) => course.title == courseTitle);
      if (courseIndex != -1) {
        courses[courseIndex] = Course(
          title: courseTitle,
          studentCount: students.length,
          averageScore: students.isNotEmpty
              ? students
                      .map((student) => student.score)
                      .reduce((a, b) => a + b) /
                  students.length
              : 0.0,
        );
        courseStudents[courseTitle] = students;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCORE APP'),
        backgroundColor: const Color.fromARGB(255, 193, 7, 255),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                course.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Students: ${course.studentCount}'),
                  SizedBox(height: 8),
                  Text('Average Score: ${course.averageScore}'),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () async {
                final updatedStudents = await Navigator.push<List<Student>>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseView(
                      courseTitle: course.title,
                      students: courseStudents[course.title] ?? [],
                    ),
                  ),
                );

                if (updatedStudents != null) {
                  _updateCourseData(course.title, updatedStudents);
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCourse = await Navigator.push<Course>(
            context,
            MaterialPageRoute(
              builder: (context) => ScoreForm(),
            ),
          );

          if (newCourse != null) {
            _addCourse(newCourse);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 193, 7, 255),
      ),
    );
  }
}
