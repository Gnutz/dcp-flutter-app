import 'package:digtial_costume_platform/domain/auth/user.dart';

abstract class IUserService {
  Future<User?> getUser(String id);

  Future<void> addUser(User user);

  Future<void> addCreatorRequest(User user);
}
