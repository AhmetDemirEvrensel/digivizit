import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys {
  userName,
  password,
  onboardingCompleted,
  unitPriceCache,
  contactNotes,
  email,
  apiToken,
}

class SharedPreferencesManager {
  SharedPreferences? preferences;

  SharedPreferencesManager();

  bool isInit() {
    return preferences != null;
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveBool(SharedKeys key, bool value) async {
    await preferences?.setBool(key.name, value);
  }

  bool? getBool(SharedKeys key) {
    return preferences?.getBool(key.name);
  }

  Future<void> saveInt(SharedKeys key, int value) async {
    await preferences?.setInt(key.name, value);
  }

  int? getInt(SharedKeys key) {
    return preferences?.getInt(key.name);
  }

  Future<void> saveDouble(SharedKeys key, double value) async {
    await preferences?.setDouble(key.name, value);
  }

  double? getDouble(SharedKeys key) {
    return preferences?.getDouble(key.name);
  }

  Future<void> saveString(SharedKeys key, String value) async {
    await preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    return preferences?.getString(key.name);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStringList(SharedKeys key) {
    return preferences?.getStringList(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    return (await preferences?.remove(key.name)) ?? false;
  }

  Future<bool> removeAll() async {
    return (await preferences?.clear()) ?? false;
  }

  Future<void> saveLocalDb<T>(SharedKeys key, T value) async {
    if (value is int) {
      await saveInt(key, value);
    } else if (value is double) {
      await saveDouble(key, value);
    } else if (value is bool) {
      await saveBool(key, value);
    } else if (value is String) {
      await saveString(key, value);
    } else if (value is List<String>) {
      await saveStringItems(key, value);
    }
  }

  Future<T?> getLocalDb<T>(SharedKeys key) async {
    if (T == int) return getInt(key) as T?;
    if (T == double) return getDouble(key) as T?;
    if (T == bool) return getBool(key) as T?;
    if (T == String) return getString(key) as T?;
    if (T == List<String>) return getStringList(key) as T?;
    return null;
  }

  Future<void> removeItemFromLocalDb(SharedKeys key) async {
    await removeItem(key);
  }
}
