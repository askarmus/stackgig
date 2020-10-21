import 'package:stackgig/models/answer_model.dart';
import 'package:stackgig/models/category_model.dart';
import 'package:stackgig/models/question_model.dart';
import 'package:stackgig/services/app_services.dart';
import 'package:stackgig/services/i_app_services.dart';

import 'i_repository.dart';

class Repository implements IRepository {
  final IAppServices appServices;

  Repository({this.appServices});

  @override
  Future<List<TopicModel>> fetchTopics() => appServices.fetchTopicList();

  @override
  Future<QuestionModel> fetchQuestionList(int categoryId) =>
      appServices.fetchQuestionList(categoryId);

  @override
  Future<QuestionModel> fetchFavouriteQuestions(String ids) =>
      appServices.fetchFavouriteQuestionList(ids);

  @override
  Future<AnswerModel> fetchAnswer(int answerId) =>
      appServices.fetchAnswer(answerId);
}
