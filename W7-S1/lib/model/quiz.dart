class Question {
  final String text;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswer,
  });
}

class Quiz {
  final List<Question> _questions = [
    Question(
      text: 'What is Flutter?',
      options: ['A framework', 'A language', 'An IDE', 'A database'],
      correctAnswer: 'A framework',
    ),
    Question(
      text: 'Who created Flutter?',
      options: ['Apple', 'Google', 'Microsoft', 'Facebook'],
      correctAnswer: 'Google',
    ),
    Question(
      text: 'Who is the best ?',
      options: ['Ranith', 'Tech', 'Ranuth', 'aoshdoasda'],
      correctAnswer: 'Ranith',
    ),
  ];

  int _currentIndex = 0;

  Question? getCurrentQuestion() {
    if (_currentIndex < _questions.length) {
      return _questions[_currentIndex];
    }
    return null;
  }

  void nextQuestion() {
    if (!isLastQuestion()) {
      _currentIndex++;
    }
  }

  bool isLastQuestion() => _currentIndex >= _questions.length - 1;

  void reset() {
    _currentIndex = 0;
  }

  List<Question> get questions => _questions;
}
