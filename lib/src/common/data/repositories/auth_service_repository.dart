import 'package:antiradar/src/common/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthServiceRepository {
  static SharedPreferences? _storage;
  static const _userKey = "user";

  Future<SharedPreferences> getStorage() async {
    if (_storage != null) return _storage!;
    _storage = await SharedPreferences.getInstance();
    return _storage!;
  }

  late final UserModel user;

  Future<UserModel?> getUser();

  Future<String?> getUserId() async => (await getStorage()).getString(_userKey);

  Future<void> setUserId(String id) async =>
      await (await getStorage()).setString(_userKey, id);

  Future<void> logOut() async => _storage?.clear();

  Future<void> login({
    required String phoneNumber,
    required int password,
  });

  Future<void> register({
    required String name,
    required String carNumber,
    required String phoneNumber,
    required String password,
  });
}
