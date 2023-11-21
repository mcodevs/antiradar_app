
import 'package:antiradar/src/common/data/models/user_model.dart';
import 'package:antiradar/src/common/data/repositories/auth_service_repository.dart';

class RealAuthService extends AuthServiceRepository {
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
  Future<UserModel?> getUser() async {}
}
