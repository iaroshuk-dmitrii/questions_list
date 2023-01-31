import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:questions_list/models/question.dart';

class QuestionsListHttp {
  Future<List<Question>> getQuestionsList({required int size, required bool random}) async {
    var url = Uri.http('unblog.ru', 'quest.php', {'size': size.toString(), 'random': random.toString()});
    log(url.toString());
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        List<dynamic> questionsJson = json.decode(response.body);
        List<Question> questionsList = questionsJson.map((json) => Question.fromJson(json)).toList();
        return questionsList;
      } else {
        throw Exception('Error');
      }
    } on TimeoutException catch (_) {
      log('TimeoutException');
      throw Exception('TimeoutException');
    } on SocketException catch (_) {
      log('SocketException');
      throw Exception('SocketException');
    } catch (e) {
      log(e.toString());
      throw Exception('Error');
    }
  }
}
