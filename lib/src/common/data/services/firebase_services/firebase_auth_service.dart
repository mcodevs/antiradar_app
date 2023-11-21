import 'package:antiradar/src/common/data/models/user_model.dart';
import 'package:antiradar/src/common/data/repositories/auth_service_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService extends AuthServiceRepository {
  FirebaseAuthService();

  static final _instance = FirebaseFirestore.instance;

  @override
  Future<void> login({
    required String phoneNumber,
    required int password,
  }) async {}

  @override
  Future<void> register({
    required String name,
    required String carNumber,
    required String phoneNumber,
    required String password,
  }) async {}

  @override
  Future<UserModel?> getUser() async {
    final id = await getUserId();
    if (id == null) {
      return null;
    } else {
      final data = await _instance.collection("users").doc(id).get();
      user = UserModel.fromMap((data.data() as Map).cast<String, Object?>());
      return user;
    }
  }
}
