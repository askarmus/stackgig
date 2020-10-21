import 'package:stackgig/models/answer_model.dart';
import 'package:stackgig/models/category_model.dart';
import 'package:stackgig/models/question_model.dart';

abstract class IAppServices {
  Future<List<TopicModel>> fetchTopicList();
  Future<QuestionModel> fetchQuestionList(int categoryId);
  Future<QuestionModel> fetchFavouriteQuestionList(String ids);
  Future<AnswerModel> fetchAnswer(int answerId);
}
