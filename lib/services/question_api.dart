import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:questions_list/models/question.dart';

class QuestionsListHttp {
  Future<List<Question>> getQuestionsList({required int size, required bool random}) async {
    var url = Uri.http('unblog.ru', 'quest.php', {'size': size.toString(), 'random': random.toString()});
    print(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> questionsJson = json.decode(response.body);
      List<Question> questionsList = questionsJson.map((json) => Question.fromJson(json)).toList();
      return questionsList;
    } else {
      throw Exception('Error');
    }
  }
}
