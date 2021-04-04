import 'package:digtial_costume_platform/domain/auth/auth_failures.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/costume/institution.dart';

abstract class IAuthService {
  Future<AuthFailure?> registerUser(
      {required String email,
      required String password,
      required Institution institution,
      required UserRole role});

  Future<AuthFailure?> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();

  Future<void> isCreator();

  Future<void> isAdmin();
}
