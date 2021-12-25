class Question {
  int id;
  String question;
  List<String> answers;
  int correctAnswer;
  bool isCorrect;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    this.isCorrect = false,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: int.parse(json['id'] ?? '0'),
      question: json['question'],
      answers: [
        json['answer1'] ?? '',
        json['answer2'] ?? '',
        json['answer3'] ?? '',
        json['answer4'] ?? '',
      ],
      correctAnswer: int.parse(json['correct'] ?? '0'),
    );
  }
}
