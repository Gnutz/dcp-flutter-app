import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/domain/auth/i_user_service.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';

class FirebaseUserRepository implements IUserService {
  final _store = FirebaseFirestore.instance;

  static const String USERS_COLLECTION = 'users';
  static const String INSTITUTIONS_COLLECTION = "institutions";
  static const String CREATOR_REQUESTS_COLLECTION = "creator_role_requests";

  @override
  Future<void> addUser(User user) async {
    // await _store.collection(USERS_COLLECTION).doc(user?.uid).set(user);
  }

  @override
  Future<User?> getUser(String id) async {
    //TODO tryCATCH
    final user = await _store.collection(USERS_COLLECTION).doc(id).get();
  }

  Future<void> addCreatorRequest(User user) async {
    _store
        .collection(INSTITUTIONS_COLLECTION)
        .doc(user.institution!.uid)
        .collection(CREATOR_REQUESTS_COLLECTION);

    ///  .add(CreatorRoleRequest(requestedBy: user));
  }
}
