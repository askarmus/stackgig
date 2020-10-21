import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:stackgig/screens/question/question_screen.dart';
import 'package:stackgig/screens/splash/splash_screen.dart';
import 'package:stackgig/screens/topic/topic_screen.dart';
import 'binding/question_bindings.dart';
import 'binding/topic_bindings.dart';

class AppRoutes {
  static const QUESTION_SCREEN = '/question';
  static const TOPIC_SCREEN = '/topic';
  static const SPLASH_SCREEN = '/splash';

  static List<GetPage> getAppRoutes = [
    GetPage(
      name: SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: QUESTION_SCREEN,
      page: () => QuestionScreen(),
      binding: QuestionBindings(),
    ),
    GetPage(
      name: TOPIC_SCREEN,
      page: () => TopicScreen(),
      binding: TopicBindings(),
    ),
  ];
}
