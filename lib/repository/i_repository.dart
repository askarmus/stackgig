import 'package:stackgig/models/answer_model.dart';
import 'package:stackgig/models/category_model.dart';
import 'package:stackgig/models/question_model.dart';

abstract class IRepository {
  Future<List<TopicModel>> fetchTopics();
  Future<QuestionModel> fetchQuestionList(int categoryId);
  Future<QuestionModel> fetchFavouriteQuestions(String ids);
  Future<AnswerModel> fetchAnswer(int answerId);
}
