import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:questions_list/business_logic/redux.dart';
import 'package:questions_list/screens/question_screen.dart';
import 'package:questions_list/widgets/my_outlined_button.dart';
import 'package:redux/redux.dart';

class QuestionsListScreen extends StatelessWidget {
  const QuestionsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(LoadAllQuestions());
    return Scaffold(
      appBar: AppBar(
        title: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, vm) {
              if (store.state.loadingState == LoadingState.loaded) {
                return const Text('Список вопросов');
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
                return ListView.builder(
                  itemCount: store.state.questionsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${store.state.questionsList[index].id + 1} вопрос: ${store.state.questionsList[index].question}',
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        store.state.questionsList[index].answers[store.state.questionsList[index].correctAnswer],
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => QuestionScreen(question: store.state.questionsList[index]))),
                    );
                  },
                );
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
                    actionsAlignment: MainAxisAlignment.center);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
