import 'package:flutter/material.dart';
import 'package:questions_list/models/question.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key, required this.question}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(question.question),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(question.answers[question.correctAnswer]),
      ),
    );
  }
}
