import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static late final SharedPreferences _preferences;
  static const String menuItemSuffix = "menuItem";
  static const String menuIndex = "menuIndex";

  SharedPrefHelper._();
  static Future<SharedPreferences> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static String getString(String key) {
    return _preferences.getString(key) ?? "";
  }

  static Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  static bool getBoolean(String key) {
    return _preferences.getBool(key) ?? false;
  }

  static Future<void> setBoolean(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  static int getMenuIndex() {
    return _preferences.getInt(menuIndex) ?? 0;
  }

  static Future<void> setMenuIndex(int index) async {
    await _preferences.setInt(menuIndex, index);
  }

  static int getParamMenuName(String title, int range) {
    for (int i = 0; i < range; i++) {
      String? name = _preferences.getString("$menuItemSuffix$i");
      if (name != null && name == title) {
        return i;
      }
    }
    return -1;
  }

  static Future<void> reorderMenu(int currentIndex, int range) async {
    for (int i = currentIndex + 1; i < range; i++) {
      String? name = _preferences.getString("$menuItemSuffix$i");
      if (name != null) {
        await _preferences.setString("$menuItemSuffix${i - 1}", name);
      }
    }
    await _preferences.remove("$menuItemSuffix$range");
  }
}
