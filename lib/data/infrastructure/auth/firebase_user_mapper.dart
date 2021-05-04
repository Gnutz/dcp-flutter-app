import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;

extension FirebaseUserDomainX on fba.User {
  User toDomainUser() {
    return User(uid: uid);
  }
}
