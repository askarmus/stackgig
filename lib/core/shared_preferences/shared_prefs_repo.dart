import 'package:shared_preferences/shared_preferences.dart';

import 'i_shared_prefs_repo.dart';

class SharedPrefsRepo implements ISharedPrefsRepo {
  Future get(String key) {
    return SharedPreferences.getInstance().then((shared) {
      return shared.get(key);
    });
  }

  setList(String key, List<String> value) {
    SharedPreferences.getInstance().then((shared) {
      shared.setStringList(key, value);
    });
  }

  Future<List<String>> getList(String key) {
    return SharedPreferences.getInstance().then((shared) {
      return shared.getStringList(key);
    });
  }

  void remove(String key) {
    SharedPreferences.getInstance().then((shared) {
      shared.remove(key);
    });
  }

  void put(String key, dynamic value) {
    SharedPreferences.getInstance().then((shared) {
      switch (value.runtimeType) {
        case bool:
          return shared.setBool(key, value);
          break;
        case int:
          shared.setInt(key, value);
          break;
        case int:
          shared.setDouble(key, value);
          break;
        case String:
          shared.setString(key, value);
          break;
        case List:
          shared.setStringList(key, value);
          break;
      }
    });
  }
}
