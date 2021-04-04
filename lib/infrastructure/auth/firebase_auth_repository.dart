/*
class FirebaseAuthRepository implements IAuthService{
  final fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;
  final _store =  FirebaseFirestore.instance;


  final String USERS_COLLECTION = 'users';



  @override
  Future<void> isCreator() {
    // TODO: implement isCreator
    throw UnimplementedError();
  }

  @override
  Future<AuthFailure?> signInWithEmailAndPassword({required String email, required String password}) async {
    print('test');
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on fba.FirebaseException catch(e){
      if(e.code == "wrong-password" || e.code == "user-not-found"){
        print('test2');
      return const AuthFailure.invalidEmailAndPasswordCombination();
      }
      else{
        return const AuthFailure.serverError();
      }
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    await _auth.signOut();
  }

  @override
  Future<void> isAdmin() {
    // TODO: implement isAdmin
    throw UnimplementedError();
  }

  @override
  Future<AuthFailure?> registerUser({required String email, required String password, required Institution institution, required UserRole role}) async {
    final isCreatorRequest = role == UserRole.creator;

    try{

      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final firebaseUser = result.user;
      final user = User.fromFirebaseUser(firebaseUser);
      await _store.collection(USERS_COLLECTION).doc(user?.uid).set(data);

      if(isCreatorRequest) {
        //TODO make a creator request:
        _store.collection(INSTITUTIONS).doc(institution.uid).collection(CREATOR_REQUESTS).add(data);
      }

    } on fba.FirebaseException catch(e){
      if(e.code == "wrong-password" || e.code == "user-not-found"){
        print('test2');
        return const AuthFailure.invalidEmailAndPasswordCombination();
      }
      else{
        return const AuthFailure.serverError();
      }
    }
    return null;
  }



  }


} */
