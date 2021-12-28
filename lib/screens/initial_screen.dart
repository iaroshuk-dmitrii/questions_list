import 'package:flutter/material.dart';
import 'package:questions_list/screens/education_screen.dart';
import 'package:questions_list/screens/test_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Название приложения'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyOutlinedButton(
                text: 'Список вопросов',
                onPressed: () {
                  //TODO
                }),
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

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton(
        child: Text(text),
        onPressed: onPressed,
        style: ButtonStyle(
          alignment: Alignment.center,
          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 20)),
          foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onSurface),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(20)),
        ),
      ),
    );
  }
}
