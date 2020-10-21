import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stackgig/models/category_model.dart';
import 'package:stackgig/screens/question/question_screen.dart';
import 'package:stackgig/screens/topic/widget/topic_card.dart';

import '../../../app_routes.dart';

class BuildTopicList extends StatelessWidget {
  final List<TopicModel> categoryList;

  BuildTopicList(this.categoryList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoryList.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TopicCard(
              title: categoryList[index].name,
              totalQuestion: categoryList[index].totalQuestion.toString(),
              imageName: categoryList[index].imageUrl,
              press: () {
                Get.toNamed(AppRoutes.QUESTION_SCREEN,
                    arguments: categoryList[index]);
              },
            ),
          );
        });
  }
}
