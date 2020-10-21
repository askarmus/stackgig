import 'package:flutter/material.dart';
import 'package:stackgig/core/shared_preferences/i_shared_prefs_repo.dart';
import 'package:stackgig/models/category_model.dart';
import 'package:stackgig/repository/i_repository.dart';
import 'package:stackgig/repository/repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:stackgig/app_controller.dart';

class TopicController extends GetxController {
  AppController appController = Get.find();

  final IRepository repository;
  final ISharedPrefsRepo sharedPrefsRepo;

  TopicController({this.repository, this.sharedPrefsRepo});

  TextEditingController searchQueryController = TextEditingController();
  List<TopicModel> _copyTopic = List<TopicModel>();
  Rx<List<TopicModel>> topics = Rx<List<TopicModel>>();

  filterTopic() {
    var result = _copyTopic
        .where((element) =>
            element.name
                .toLowerCase()
                .contains(searchQueryController.text.toLowerCase()) ||
            searchQueryController.text == "")
        .toList();
    topics.value = result;
  }

  fetchTopics() async {
    try {
      var result = await repository.fetchTopics();
      topics.value = result;
      _copyTopic.addAll(result); //cloneQuestion(result);
    } catch (_) {
      print(_);
    }
  }
}
