import 'package:flutter/material.dart';
import 'package:stackgig/models/question_model.dart';
import 'package:stackgig/screens/question/widget/question_card.dart';
import 'build_show_modal_bottom_sheet.dart';

class BuildQuestionList extends StatelessWidget {
  final List<Questions> questionList;
  BuildQuestionList(this.questionList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: questionList.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: QuestionCard(
              title: questionList[index].title,
              press: () {
                return buildShowModalBottomSheet(context, questionList[index]);
              },
            ),
          );
        });
  }
}
