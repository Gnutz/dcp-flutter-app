// have to do a named import to separate application user class from the
//firebase auth User class
import 'package:firebase_auth/firebase_auth.dart';

class AuthOldService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //User _userFromFirebaseUser(User user) {
  // return user != null ? User(uid: user.uid) : null;
  //}

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      //return _userFromFirebaseUser(result.user);
      return result.user;
    } on FirebaseException catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      print("email: $email");
      print("password: $password");
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? firebaseUser = result.user;
      //return _userFromFirebaseUser(firebaseUser);
      return firebaseUser;
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<void> signOut() async {
       await _auth.signOut();
  }
}
