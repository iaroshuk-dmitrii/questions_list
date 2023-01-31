import 'dart:developer';

import 'package:questions_list/business_logic/redux.dart';
import 'package:questions_list/models/question.dart';
import 'package:questions_list/services/question_api.dart';
import 'package:redux/redux.dart';

class HttpMiddleware implements MiddlewareClass<AppState> {
  final QuestionsListHttp _questionsListHttp = QuestionsListHttp();

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is LoadQuestions) {
      _questionsListHttp.getQuestionsList(size: 10, random: true).then((List<Question> result) {
        log('LoadFinishedOk');
        store.dispatch(LoadFinishedOk(result));
      }, onError: (e) {
        log('LoadFinishedErr: ${e.toString()}');
        store.dispatch(LoadFinishedErr());
      });
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}
