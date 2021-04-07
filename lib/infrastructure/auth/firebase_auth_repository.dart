import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/domain/auth/auth_failures.dart';
import 'package:digtial_costume_platform/domain/auth/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/i_user_service.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;

class FirebaseAuthRepository implements IAuthService {
  final fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  final IUserService _userRepository;

  FirebaseAuthRepository(this._userRepository);

  @override
  Future<void> isCreator() {
    // TODO: implement isCreator
    throw UnimplementedError();
  }

  @override
  Future<AuthFailure?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on fba.FirebaseException catch (e) {
      if (e.code == "wrong-password" || e.code == "user-not-found") {
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
  Future<void> isAdmin() {
    throw UnimplementedError();
  }

  @override
  Future<AuthFailure?> registerUser(
      {required String email,
      required String password,
      required Institution institution,
      required UserRole role}) async {
    final isCreatorRequest = role == UserRole.creator;

    final user = User(
      email: email,
      isCreative: role == UserRole.creative,
      institution: institution,
    );

    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final firebaseUser = result.user;
      user.uid = firebaseUser?.uid;
      await _userRepository.addUser(user);

      if (isCreatorRequest) {
        //TODO make a creator request:
        _userRepository.addCreatorRequest(user);
      }
    } on fba.FirebaseException catch (e) {
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return const AuthFailure.invalidEmailAndPasswordCombination();
      } else {
        return const AuthFailure.serverError();
      }
    }
    return null;
  }

  @override
  Future<User?> getCurrentUser() async {
    final authedUser = _auth.currentUser;
    if (authedUser != null) {
      return await _userRepository.getUser(authedUser.uid);
    }

    return null;
  }
}
