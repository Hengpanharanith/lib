import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Updated to match the new file name
import 'screens/question_screen.dart'; // Updated to match the new file name
import 'screens/result_screen.dart'; // Updated to match the new file name
import 'model/quiz.dart';
import 'model/submission.dart';

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStarted;
  final Quiz _quiz = Quiz(); // Mock quiz data
  final Submission _submission = Submission();

  void startQuiz() {
    setState(() {
      _quizState = QuizState.started;
    });
  }

  void answerQuestion(String answer) {
    _submission.addAnswer(_quiz.getCurrentQuestion()!, answer);

    setState(() {
      if (_quiz.isLastQuestion()) {
        _quizState = QuizState.finished;
      } else {
        _quiz.nextQuestion();
      }
    });
  }

  void restartQuiz() {
    setState(() {
      _quizState = QuizState.notStarted;
      _submission.removeAnswers();
      _quiz.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_quizState) {
      case QuizState.notStarted:
        return WelcomeScreen(onStart: startQuiz, quizTitle: "Flutter Quiz");
      case QuizState.started:
        return QuestionScreen(
          question: _quiz.getCurrentQuestion()!,
          onTap: answerQuestion,
        );
      case QuizState.finished:
        return ResultScreen(
          quiz: _quiz,
          submission: _submission,
          onRestart: restartQuiz,
        );
      default:
        return const SizedBox(); // Fallback widget.
    }
  }
}
