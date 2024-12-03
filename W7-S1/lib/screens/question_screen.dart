import 'package:flutter/material.dart';
import '../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String) onTap;

  const QuestionScreen({
    Key? key,
    required this.question,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(question.text, style: const TextStyle(fontSize: 25)),
          ),
          ...question.options.map((option) {
            return ListTile(
              title: Text(option),
              onTap: () => onTap(option),
            );
          }).toList(),
        ],
      ),
    );
  }
}
