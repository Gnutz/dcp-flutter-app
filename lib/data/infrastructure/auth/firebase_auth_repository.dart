import 'package:digtial_costume_platform/domain/auth/auth_failures.dart';
import 'package:digtial_costume_platform/domain/auth/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/i_user_service.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;

class FirebaseAuthRepository implements IAuthService {
  final fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;
  final IUserService _userRepository;

  FirebaseAuthRepository(this._userRepository);

  @override
  Future<bool> isCreator() async {
    final currentUser = await getCurrentUser();
    if (currentUser != null) {
      return currentUser.isCreator;
    } else {
      return false;
    }
  }

  @override
  Future<AuthFailure?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on fba.FirebaseException catch (e) {
      if (e.code == ErrorCodeConstants.wrongPassword ||
          e.code == ErrorCodeConstants.userNotFound) {
        return const AuthFailure.invalidEmailAndPasswordCombination();
      } else {
        return const AuthFailure.serverError();
      }
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<bool> isAdmin() async {
    final currentUser = await getCurrentUser();
    if (currentUser != null) {
      return currentUser.isAdmin;
    } else {
      return false;
    }
  }

  @override
  Future<AuthFailure?> registerUser(
      {required String name,
      required String email,
      required String password,
      required Institution institution,
      required UserRole role}) async {
    final isCreatorRequest = role == UserRole.creator;

    final user = User(
      name: name,
      email: email,
      institution: institution,
    );

    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final firebaseUser = result.user;
      user.id = firebaseUser?.uid;

      await _userRepository.addUser(user);

      if (isCreatorRequest) {
        _userRepository.addCreatorRequest(user);
      }
    } on fba.FirebaseException catch (e) {
      if (e.code == ErrorCodeConstants.wrongPassword ||
          e.code == ErrorCodeConstants.userNotFound) {
        return const AuthFailure.invalidEmailAndPasswordCombination();
      } else {
        return const AuthFailure.serverError();
      }
    }
    return null;
  }

  @override
  Future<User?> getCurrentUser() async {
    final authenticatedUser = _auth.currentUser;
    if (authenticatedUser == null) {
      return null;
    } else {
      return _userRepository.getUser(authenticatedUser.uid);
    }
  }

  @override
  Future<List<Institution>> getInstitutions() async {
    return _userRepository.getInstitution();
  }
}
