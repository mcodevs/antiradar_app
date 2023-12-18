import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/radars/speed_radar.dart';

final class LocalDBService {
  const LocalDBService._();

  static const _loggedKey = "isLogged";
  static const _radarsKey = "radars";

  static Future<void> initialize() async {
    _storage = await SharedPreferences.getInstance();
    // await _storage.clear();
  }

  static late final SharedPreferences _storage;

  static SharedPreferences get storage => _storage;

  static bool get isLogged => _storage.getBool(_loggedKey) ?? false;

  static String initialRoute({required String home, required String intro}) =>
      isLogged ? home : intro;

  static Future<void> saveRadars(List<SpeedRadar> radars) async {
    await _storage.setStringList(
        _radarsKey, radars.map((e) => jsonEncode(e.toMap())).toList());
  }

  static List<SpeedRadar> readRadars() {
    final radars = _storage.getStringList(_radarsKey) ?? [];
    return radars.map((e) => SpeedRadar.fromMap(jsonDecode(e))).toList();
  }
}
