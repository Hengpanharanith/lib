import 'quiz.dart';

class Answer {
  final Question question;
  final String answer;

  Answer({required this.question, required this.answer});

  bool isCorrect() {
    return answer == question.correctAnswer;
  }
}

class Submission {
  final Map<Question, Answer> _answers = {};

  int getScore() {
    return _answers.values.where((answer) => answer.isCorrect()).length;
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }

  void addAnswer(Question question, String answer) {
    _answers[question] = Answer(question: question, answer: answer);
  }

  void removeAnswers() {
    _answers.clear();
  }
}
