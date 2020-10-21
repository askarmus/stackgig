import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stackgig/models/question_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:stackgig/screens/question/question_controller.dart';
import '../../../app_controller.dart';
import '../../../widgets/appbar_action.dart';

Future<void> buildShowModalBottomSheet(
    BuildContext context, Questions question) {
  final QuestionController _questionController = Get.find();
  final AppController appController = Get.put(AppController());
  final isFavorite = false.obs;

  isFavorite.value = appController.favQuestions.contains(question.id);

  _questionController.fetchAnswer(question.id);

  return showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(10)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Obx(() => _questionController.answers.value == null
            ? FractionallySizedBox(
                heightFactor: 0.8,
                child: Center(
                  child: Text("Loading Answer...",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              )
            : FractionallySizedBox(
                heightFactor: 0.8,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: AutoSizeText(
                          question.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Row(
                                children: [
                                  Text("Source: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("google.com",
                                      style:
                                          TextStyle(color: Colors.deepOrange))
                                ],
                              ),
                            ),
                            Obx(() => CustomAppBarAction(
                                  background: isFavorite.value
                                      ? Colors.green
                                      : Colors.grey,
                                  action: () async {
                                    await _questionController
                                        .manageFavoirteQuestion(question.id);
                                    isFavorite.value = appController
                                        .favQuestions
                                        .contains(question.id);
                                  },
                                  icon: Icons.favorite,
                                  quantity: null,
                                ))
                          ],
                        ),
                      ),
                      Html(
                        data: _questionController.answers.value[0].answer,
                        style: {
                          "pre": Style(
                              color: Colors.white,
                              backgroundColor: Color(0xFF29292e),
                              padding: EdgeInsets.all(10))
                        },
                      )
                    ],
                  ),
                ),
              ));
      });
}
