import 'package:stackgig/core/shared_preferences/i_shared_prefs_repo.dart';
import 'package:stackgig/models/answer_model.dart';
import 'package:stackgig/models/question_model.dart';
import 'package:stackgig/repository/i_repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:stackgig/app_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionController extends GetxController {
  final IRepository repository;
  final ISharedPrefsRepo sharedPrefsRepo;

  QuestionController({this.repository, this.sharedPrefsRepo});

  AppController appController = Get.find();
  final _isLoading = false.obs;
  List<Questions> _copyQuestion = List<Questions>();
  Rx<List<Questions>> questions = Rx<List<Questions>>();
  Rx<List<Answer>> answers = Rx<List<Answer>>();

  bool get isLoadingStream => _isLoading.value;

  manageFavoirteQuestion(int questionId) async {
    if (appController.favQuestions.contains(questionId)) {
      appController.favQuestions.remove(questionId);
    } else {
      appController.favQuestions.add(questionId);
    }

    List<String> strList =
        appController.favQuestions.value.map((i) => i.toString()).toList();

    sharedPrefsRepo.setList("favarite_question_key", strList);
  }

  clearFavoriteQuestion() async {
    sharedPrefsRepo.remove('favarite_question_key');
    appController.favQuestions.value = [];
  }

  fetchQuestions(int topicId) async {
    try {
      QuestionModel result = await repository.fetchQuestionList(topicId);
      questions.value = result.questions;
      _copyQuestion.addAll(result.questions);
    } catch (_) {
      print(_);
    }
  }

  fetchFavouriteQuestions() async {
    try {
      var ids = appController.favQuestions.value.join(",");
      if (ids != "") {
        _isLoading.value = true;
        QuestionModel result = await repository.fetchFavouriteQuestions(ids);
        questions.value = result.questions;
        _copyQuestion.addAll(result.questions);
      } else {
        Get.snackbar("Favorite ", "Favorite question list is empty");
      }
    } catch (_) {
      print(_);
    }
  }

  fetchAnswer(int questionId) async {
    answers.value = null;
    try {
      AnswerModel result = await repository.fetchAnswer(questionId);
      answers.value = result.answer;
    } catch (_) {
      print(_);
    }
  }

  filterQuestion(int difficulty) {
    var filteredResult = _copyQuestion
        .where((item) => item.difficulty == difficulty || difficulty == 0)
        .toList();
    questions.value = filteredResult;
  }
}
