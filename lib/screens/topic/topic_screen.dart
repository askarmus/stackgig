import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackgig/screens/question/question_screen.dart';
import 'package:stackgig/screens/topic/topic_controller.dart';
import 'package:stackgig/screens/topic/widget/build_topic_list.dart';
import 'package:stackgig/utils/colors.dart';
import 'package:stackgig/widgets/appbar_action.dart';
import 'package:stackgig/widgets/drawer.dart';
import 'package:stackgig/widgets/rounded_input.dart';
import 'package:get/get.dart';
import 'package:shape_of_view/shape_of_view.dart';
import '../../app_controller.dart';
import '../../app_routes.dart';

class TopicScreen extends StatelessWidget {
  final AppController _appController = Get.put<AppController>(AppController());
  final TopicController _topicController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _topicController.fetchTopics();
    var size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFF2d2d51),
        drawer: buildDrawer(context),
        body: Stack(children: [
          ShapeOfView(
            elevation: 0,
            shape: ArcShape(height: 40, position: ArcPosition.Bottom),
            child: Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .46,
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
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/fullstack-logo.png",
                        width: 200,
                      ),
                      Row(
                        children: [
                          Obx(() => CustomAppBarAction(
                                action: () => {
                                  if (_appController.favQuestions.length > 0)
                                    {
                                      Get.toNamed(AppRoutes.QUESTION_SCREEN,
                                          arguments: null)
                                    }
                                  else
                                    {
                                      Get.snackbar("Favorite",
                                          "No favorite question added to show.")
                                    }
                                },
                                icon: Icons.favorite,
                                quantity:
                                    _appController.favQuestions.value.length,
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
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    "28 Topics and 1380 Questions & Answers",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    maxLines: 2,
                  ),
                  RoundedInput(
                    controller: _topicController.searchQueryController,
                    onChnage: (value) {
                      _topicController.filterTopic();
                    },
                  ),
                  Expanded(
                    child: Obx(() {
                      if (_topicController.topics.value != null) {
                        return BuildTopicList(_topicController.topics.value);
                      } else {
                        return Center(
                            child: Text("Loading...",
                                style: TextStyle(color: AppColors.WHITE)));
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
