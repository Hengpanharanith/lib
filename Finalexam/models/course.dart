// TODO
class Course {
  final String name;
  final List<StudentScore> scores;

  Course(this.name, this.scores);

  double get average {
    if (scores.isEmpty) return 0;
    return scores.map((score) => score.score).reduce((a, b) => a + b) /
        scores.length;
  }
}

class StudentScore {
  final String studentName;
  final double score;

  StudentScore(this.studentName, this.score);
}
