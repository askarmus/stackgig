abstract class ISharedPrefsRepo {
  Future get(String key);
  void setList(String key, List<String> value);
  void put(String key, dynamic value);
  Future<List<String>> getList(String key);
  void remove(String key);
}
