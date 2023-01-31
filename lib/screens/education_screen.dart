import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:questions_list/business_logic/redux.dart';
import 'package:questions_list/widgets/answer_box.dart';
import 'package:questions_list/widgets/my_outlined_button.dart';
import 'package:questions_list/widgets/on_will_pop_dialog.dart';
import 'package:redux/redux.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(LoadQuestions());
    return WillPopScope(
      onWillPop: () => onWillPopDialog(
        context: context,
        title: 'Выйти из режима обучения?',
        onConfirm: () {
          Navigator.of(context).pop();
          store.dispatch(ResetTest());
        },
      ),
      child: Scaffold(
        appBar: AppBar(
          title: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, vm) {
                if (store.state.loadingState == LoadingState.loaded) {
                  if (store.state.questionNumber < store.state.questionsList.length) {
                    return Text('Вопрос: ${store.state.questionNumber + 1} из ${store.state.questionsList.length}');
                  } else {
                    return const Text('Результаты');
                  }
                } else if (store.state.loadingState == LoadingState.failed) {
                  return const Text('Ошибка загрузки');
                } else {
                  return const Text('Загрузка данных');
                }
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, vm) {
                if (store.state.loadingState == LoadingState.loaded) {
                  if (store.state.questionNumber < store.state.questionsList.length) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.state.question!.question,
                          style: const TextStyle(fontSize: 20),
                        ),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: store.state.question!.answers.length,
                          itemBuilder: (context, i) {
                            Color? color;
                            if (store.state.question!.isCorrect != null) {
                              if (store.state.question!.pickedAnswer == i + 1 &&
                                  store.state.question!.correctAnswer != i + 1) {
                                color = Colors.red;
                              }
                              if (store.state.question!.correctAnswer == i + 1) {
                                color = Colors.green;
                              }
                            }
                            return AnswerBox(
                                text: store.state.question!.answers[i],
                                onPressed: () {
                                  if (store.state.question!.isCorrect == null) {
                                    store.dispatch(CheckAnswer(i + 1));
                                  }
                                },
                                color: color);
                          },
                        ),
                        Expanded(child: Container()),
                        Center(
                          child: OutlinedButton(
                            onPressed: () => store.dispatch(GetNewQuestion()),
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              textStyle:
                                  MaterialStateProperty.all<TextStyle>(const TextStyle(fontWeight: FontWeight.bold)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onSurface),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(20)),
                            ),
                            child: const Text('Следующий вопрос'),
                          ),
                        ),
                      ],
                    );
                  } else {
                    int correctAnswers = 0;
                    for (var element in store.state.questionsList) {
                      element.isCorrect == true ? correctAnswers++ : null;
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Вы ответили правильно на:',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('$correctAnswers вопросов из ${store.state.questionsList.length}'),
                        ],
                      ),
                    );
                  }
                } else if (store.state.loadingState == LoadingState.failed) {
                  return AlertDialog(
                    title: const Text(
                      'Ошибка загрузки',
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      MyOutlinedButton(
                        text: 'Веруться назад',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
