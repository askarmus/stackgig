import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:stackgig/core/shared_preferences/i_shared_prefs_repo.dart';
import 'package:stackgig/core/shared_preferences/shared_prefs_repo.dart';
import '../app_controller.dart';

class AppBindings extends Bindings {
  void dependencies() {
    print("dependencies");
    Get.lazyPut<ISharedPrefsRepo>(() => SharedPrefsRepo());
    Get.lazyPut<AppController>(() => AppController());
  }
}
