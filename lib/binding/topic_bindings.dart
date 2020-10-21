import 'package:get/get.dart';
import 'package:stackgig/binding/question_bindings.dart';
import 'package:stackgig/core/shared_preferences/i_shared_prefs_repo.dart';
import 'package:stackgig/core/shared_preferences/shared_prefs_repo.dart';
import 'package:stackgig/repository/i_repository.dart';
import 'package:stackgig/repository/repository.dart';
import 'package:stackgig/screens/topic/topic_controller.dart';
import 'package:stackgig/services/app_services.dart';
import 'package:stackgig/services/i_app_services.dart';

class TopicBindings extends Bindings {
  void dependencies() {
    Get.lazyPut<IRepository>(() => Repository(appServices: Get.find()));
    Get.lazyPut<IAppServices>(() => AppServices());
    Get.lazyPut<ISharedPrefsRepo>(() => SharedPrefsRepo());

    Get.lazyPut<TopicController>(() => TopicController(
          repository: Get.find(),
          sharedPrefsRepo: Get.find(),
        ));

    QuestionBindings().dependencies();
  }
}
