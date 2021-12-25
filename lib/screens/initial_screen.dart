import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:questions_list/screens/education_screen.dart';
import 'package:questions_list/screens/test_screen.dart';
import 'package:questions_list/business_logic/redux.dart';
import 'package:redux/redux.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Название приложения'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: OutlinedButton(
                child: const Text('Режим обучения'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EducationScreen()));
                  // store.dispatch(LoadQuestions());
                },
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: OutlinedButton(
                child: const Text('Режим теста'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TestScreen()));
                },
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
            )
          ],
        ),
      ),
    );
  }
}
