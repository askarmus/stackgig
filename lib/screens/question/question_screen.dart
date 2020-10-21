import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackgig/models/category_model.dart';
import 'package:stackgig/screens/question/question_controller.dart';
import 'package:stackgig/screens/question/widget/build_question_list.dart';
import 'package:stackgig/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:stackgig/widgets/drawer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../app_controller.dart';
import '../../widgets/appbar_action.dart';

class QuestionScreen extends StatelessWidget {
  final QuestionController _questionController = Get.find();
  final AppController appController = Get.put(AppController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TopicModel topicModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if (topicModel != null) {
      _questionController.fetchQuestions(topicModel.id);
    } else {
      _questionController.fetchFavouriteQuestions();
    }

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFF2d2d51),
        drawer: buildDrawer(context),
        body: Stack(children: [
          ShapeOfView(
            elevation: 0,
            shape: ArcShape(height: 40, position: ArcPosition.Bottom),
            child: Container(
              height: size.height * .40,
              decoration: BoxDecoration(
                color: Color(0xFF009be6),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 20, 7, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAppBarAction(
                          action: () => {Navigator.pop(context)},
                          icon: Icons.chevron_left,
                          quantity: null,
                        ),
                        Row(
                          children: [
                            Obx(() => CustomAppBarAction(
                                  action: () {
                                    if (appController.favQuestions.length > 0) {
                                      _questionController
                                          .fetchFavouriteQuestions();
                                    } else {
                                      Get.snackbar("Favorite",
                                          "No favorite question added to show.");
                                    }
                                  },
                                  icon: Icons.favorite,
                                  quantity:
                                      appController.favQuestions.value.length,
                                )),
                            SizedBox(width: 10),
                            CustomAppBarAction(
                              action: () =>
                                  _scaffoldKey.currentState.openDrawer(),
                              icon: Icons.menu,
                              quantity: null,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AutoSizeText(
                          "${_questionController.isLoadingStream ? appController.favQuestions.length : topicModel.totalQuestion} ${_questionController.isLoadingStream ? "Favorite " : topicModel.name} Questions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ToggleSwitch(
                      minWidth: 90.0,
                      initialLabelIndex: 0,
                      cornerRadius: 20.0,
                      activeBgColor: Color(0xFFb9b9b9),
                      activeFgColor: Colors.white,
                      inactiveBgColor: Color(0xFF27b6f6),
                      inactiveFgColor: Colors.white,
                      labels: ['All', 'Easy', 'Medium', 'Hard'],
                      activeBgColors: [
                        Color(0xFF2d2d51),
                        Color(0xFF2d2d51),
                        Color(0xFF2d2d51),
                        Color(0xFF2d2d51)
                      ],
                      onToggle: (index) {
                        _questionController.filterQuestion(index);
                      },
                    ),
                  ),
                  Expanded(
                    child: Obx(() {
                      if (_questionController.questions.value != null) {
                        return BuildQuestionList(
                            _questionController.questions.value);
                      } else {
                        return Center(
                            child: Text(
                          "Loading...",
                          style: TextStyle(color: AppColors.WHITE),
                        ));
                      }
                    }),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
