import 'package:get/get.dart';
import 'package:stackgig/core/shared_preferences/i_shared_prefs_repo.dart';
import 'package:stackgig/core/shared_preferences/shared_prefs_repo.dart';
import 'package:stackgig/repository/i_repository.dart';
import 'package:stackgig/repository/repository.dart';
import 'package:stackgig/screens/question/question_controller.dart';
import 'package:stackgig/services/app_services.dart';
import 'package:stackgig/services/i_app_services.dart';

class QuestionBindings extends Bindings {
  void dependencies() {
    Get.lazyPut<IRepository>(() => Repository(appServices: Get.find()));
    Get.lazyPut<IAppServices>(() => AppServices());
    Get.lazyPut<ISharedPrefsRepo>(() => SharedPrefsRepo());
    Get.lazyPut<QuestionController>(() => QuestionController(
          repository: Get.find(),
          sharedPrefsRepo: Get.find(),
        ));
  }
}
