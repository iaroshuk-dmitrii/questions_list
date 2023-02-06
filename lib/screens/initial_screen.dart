import 'package:flutter/material.dart';
import 'package:questions_list/screens/education_screen.dart';
import 'package:questions_list/screens/help_screen.dart';
import 'package:questions_list/screens/questions_list_screen.dart';
import 'package:questions_list/screens/test_screen.dart';
import 'package:questions_list/widgets/my_outlined_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Название приложения'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpScreen())),
            icon: const Icon(Icons.question_mark),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyOutlinedButton(
              text: 'Список вопросов',
              onPressed: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QuestionsListScreen())),
            ),
            MyOutlinedButton(
              text: 'Режим обучения',
              onPressed: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EducationScreen())),
            ),
            MyOutlinedButton(
              text: 'Режим теста',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TestScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
