import 'package:questions_list/models/question.dart';

AppState reducer(AppState state, dynamic action) {
  List<Question> questionsList = state.questionsList;
  Question? question = state.question;
  int questionNumber = state.questionNumber;
  LoadingState loadingState = state.loadingState;
  if (action is LoadQuestions) {
    loadingState = LoadingState.loading;
  }
  if (action is LoadFinishedErr) {
    loadingState = LoadingState.failed;
  }
  if (action is LoadFinishedOk) {
    loadingState = LoadingState.loaded;
    questionsList = action.questionsList;
    questionNumber = 0;
    question = questionsList[questionNumber];
  }
  if (action is GetNewQuestion) {
    questionNumber = questionNumber + 1;
    if (questionNumber < questionsList.length) {
      question = questionsList[questionNumber];
    }
  }
  if (action is CheckAnswer) {
    if (questionNumber < questionsList.length) {
      if (action.answerNumber == question?.correctAnswer) {
        question?.isCorrect = true;
        questionsList[questionNumber].isCorrect = true;
      } else {
        question?.isCorrect = false;
        questionsList[questionNumber].isCorrect = false;
      }
      question?.pickedAnswer = action.answerNumber;
      questionsList[questionNumber].pickedAnswer = action.answerNumber;
    }
  }
  if (action is ResetTest) {
    loadingState = LoadingState.idle;
  }

  return AppState(
    questionsList: questionsList,
    question: question,
    questionNumber: questionNumber,
    loadingState: loadingState,
  );
}

class AppState {
  List<Question> questionsList;
  int questionNumber;
  Question? question;
  LoadingState loadingState;
  AppState({
    required this.questionsList,
    required this.questionNumber,
    this.question,
    required this.loadingState,
  });

  AppState.initialState()
      : questionsList = <Question>[],
        questionNumber = 0,
        loadingState = LoadingState.idle;
}

abstract class Action {}

class GetNewQuestion extends Action {
  GetNewQuestion();
}

class LoadQuestions extends Action {
  LoadQuestions();
}

class CheckAnswer extends Action {
  int answerNumber;
  CheckAnswer(this.answerNumber);
}

class LoadFinishedOk extends Action {
  List<Question> questionsList;
  LoadFinishedOk(this.questionsList);
}

class LoadFinishedErr extends Action {
  LoadFinishedErr();
}

class ResetTest extends Action {
  ResetTest();
}

enum LoadingState { idle, loading, loaded, failed }
