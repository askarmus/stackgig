import 'dart:async';
import 'dart:convert';
import 'package:stackgig/core/app_config.dart';
import 'package:stackgig/models/answer_model.dart';
import 'package:stackgig/models/category_model.dart';
import 'package:stackgig/models/question_model.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:stackgig/services/i_app_services.dart';

class AppServices implements IAppServices {
  Client client = Client();

  @override
  Future<List<TopicModel>> fetchTopicList() async {
    Response response =
        await client.get("${API_BASE_URL}InterviewQuestion/GetTopics");
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new TopicModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load topic');
    }
  }

  @override
  Future<QuestionModel> fetchQuestionList(int categoryId) async {
    Response response = await client
        .get("${API_BASE_URL}InterviewQuestion/GetQuestionsAsync/$categoryId");
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return QuestionModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load questions');
    }
  }

  @override
  Future<QuestionModel> fetchFavouriteQuestionList(String ids) async {
    Response response = await client.get(
        "${API_BASE_URL}InterviewQuestion/GetQuestionsByFavoriteAsync/$ids/true");
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return QuestionModel.fromJson(jsonResponse);
    } else
      throw Exception('Failed to load favorite questions');
  }

  @override
  Future<AnswerModel> fetchAnswer(int answerId) async {
    Response response = await client
        .get("${API_BASE_URL}InterviewQuestion/GetAnswerAsync/$answerId");
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return AnswerModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load answer');
    }
  }
}
