import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/domain/auth/creator_role_request.dart';
import 'package:digtial_costume_platform/domain/auth/i_user_service.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';

class FirebaseUserRepository implements IUserService {
  final _store = FirebaseFirestore.instance;

  static const String USERS_COLLECTION = 'users';
  static const String INSTITUTIONS_COLLECTION = "institutions";
  static const String CREATOR_REQUESTS_COLLECTION = "creator_role_requests";
  static const String _INSTITUTIONS = 'institutions';

  @override
  Future<void> addUser(User user) async {
    try {
      await _store
          .collection(USERS_COLLECTION)
          .doc(user.uid)
          .set(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<User?> getUser(String id) async {
    final snapshot = await _store.collection(USERS_COLLECTION).doc(id).get();
    final json = snapshot.data();
    if (json != null) {
      return User.fromJson(json)..uid = id;
    }
    return null;
  }

  @override
  Future<void> addCreatorRequest(User user) async {
    _store
        .collection(INSTITUTIONS_COLLECTION)
        .doc(user.institution!.id)
        .collection(CREATOR_REQUESTS_COLLECTION)
        .add(CreatorRoleRequest(requestedBy: user).toJson());
  }

  @override
  Future<List<Institution>> getInstitution() async {
    final result = await _store.collection(_INSTITUTIONS).get();
    return result.docs
        .map((doc) => Institution.fromJson(doc.data())..id = doc.id)
        .toList();
  }
}
