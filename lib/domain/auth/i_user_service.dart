import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';

abstract class IUserService {
  Future<User?> getUser(String id);

  Future<void> addUser(User user);

  Future<List<Institution>> getInstitution();

  Future<void> addCreatorRequest(User user);
}
