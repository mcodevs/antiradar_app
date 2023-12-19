import 'dart:convert';

import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
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

  static Future<void> saveRadars(Set<RadarModel> radars) async {
    await _storage.setStringList(
        _radarsKey, radars.map((e) => jsonEncode(e.toMap())).toList());
  }

  static Set<RadarModel> readRadars() {
    final radars = _storage.getStringList(_radarsKey) ?? [];
    return radars.map((e) => SpeedRadar.fromMap(jsonDecode(e))).toSet();
  }

  static Future<Set<RadarModel>> addRadar(RadarModel model) async {
    final radars = readRadars();
    radars.add(model);
    await saveRadars(radars);
    return radars;
  }

  static Future<Set<RadarModel>> remove(RadarModel model) async {
    final radars = readRadars();
    radars.remove(model);
    await saveRadars(radars);
    return radars;
  }

  static Future<Set<RadarModel>> update(RadarModel model) async {
    final radars = readRadars();
    radars.remove(model);
    radars.add(model);
    await saveRadars(radars);
    return radars;
  }

}
