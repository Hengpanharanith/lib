import 'package:flutter/material.dart';
import '../models/student.dart';
import 'score_form.dart';

class CourseView extends StatefulWidget {
  final String courseTitle;
  final List<Student> students;

  const CourseView(
      {super.key, required this.courseTitle, required this.students});

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  late List<Student> _students;

  @override
  void initState() {
    super.initState();
    _students = widget.students;
  }

  void _addStudent(Map<String, dynamic> studentData) {
    setState(() {
      _students
          .add(Student(name: studentData['name'], score: studentData['score']));
    });
  }

  int countStudents() {
    return _students.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseTitle),
        backgroundColor: const Color.fromARGB(255, 193, 7, 255),
      ),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          final student = _students[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                student.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Score: ${student.score}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(
              builder: (context) => ScoreForm(),
            ),
          );

          if (result != null) {
            _addStudent(result);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 193, 7, 255),
      ),
    );
  }

  @override
  void dispose() {
    Navigator.pop(context, _students);
    super.dispose();
  }
}
