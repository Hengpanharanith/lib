class Quiz {
  List<Question> questions = [];
  List<Participant> participants = [];

  void addSingleQuestion(Question singleQuestion) {
    questions.add(singleQuestion);
  }

  void addMultipleQuestions(List<Question> multipleQuestions) {
    questions.addAll(multipleQuestions);
  }

  void addParticipant(Participant participant) {
    participants.add(participant);
  }

  // New calculateResults method to handle scoring directly in Quiz
  void calculateResults() {
    for (var participant in participants) {
      int score = 0;
      for (var question in questions) {
        if (question is SingleChoice) {
          if (participant.singleAnswer == question.getCorrectAnswer()?.first) {
            score += 1;
          }
        } else if (question is MultipleChoice) {
          if (question.getCorrectAnswer()!.every(
                  (answer) => participant.multipleAnswers.contains(answer)) &&
              participant.multipleAnswers.length ==
                  question.getCorrectAnswer()!.length) {
            score += 1;
          }
        }
      }
      participant.score = score; // Update participant's score
    }
  }

  void displayResults() {
    for (var participant in participants) {
      print(
          '${participant.firstName} ${participant.lastName} scored: ${participant.score}');
    }
  }
}

class Question {
  String? title;
  List<String>? correctAnswer;
  List<String> options;

  Question(this.title, this.correctAnswer, this.options);

  List<String>? getCorrectAnswer() {
    return correctAnswer;
  }
}

class Participant {
  String? firstName;
  String? lastName;
  int score = 0;
  String? singleAnswer;
  List<String> multipleAnswers = [];

  Participant(this.firstName, this.lastName);
  void selectSingleAnswer(String answer) {
    singleAnswer = answer;
  }

  void selectMultipleAnswers(List<String> answers) {
    multipleAnswers = answers;
  }
}

class SingleChoice extends Question {
  SingleChoice(super.title, super.correctAnswer, super.options);
}

class MultipleChoice extends Question {
  MultipleChoice(super.title, super.correctAnswer, super.options);
}

void main() {
  Quiz quiz = Quiz();
  SingleChoice q1 =
      SingleChoice("What is Cat?", ["Water"], ["Fruit", "Water", "Animal"]);
  MultipleChoice q2 = MultipleChoice(
      "Which are the programming languages?",
      ["HTML", "Java", "C++", "Dart"],
      ["Java", "Blue language", "C++", "Dart", "HTML"]);

  quiz.addSingleQuestion(q1);
  quiz.addMultipleQuestions([q2]);

  Participant p1 = Participant("Heng", "Visal");
  p1.selectSingleAnswer("Water");
  p1.selectMultipleAnswers(["HTML", "Java", "C++", "Dart"]);

  Participant p2 = Participant("Heng", "Panharanith");
  p2.selectSingleAnswer("Water");
  p2.selectMultipleAnswers(["Java", "Dart"]);

  quiz.addParticipant(p1);
  quiz.addParticipant(p2);

  quiz.calculateResults();
  quiz.displayResults();
}
