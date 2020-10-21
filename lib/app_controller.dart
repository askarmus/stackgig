import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'core/shared_preferences/i_shared_prefs_repo.dart';
import 'core/shared_preferences/shared_prefs_repo.dart';

class AppController extends GetxController {
  final _sharedPrefsRepo = Get.put<ISharedPrefsRepo>(SharedPrefsRepo());
  RxList<int> favQuestions = RxList<int>([]);

  fetchLocalFavQuizIds() async {
    var favIds = await _sharedPrefsRepo.getList("favarite_question_key");
    if (favIds != null) {
      favQuestions.clear();
      favIds.forEach((element) {
        favQuestions.add(int.parse(element));
      });
    }
  }
}
