part of 'auth_bloc.dart';

class AuthState {
  User? user;

  AuthState(this.user);
}

class UnAuthenticated extends AuthState {
  UnAuthenticated() : super(null);
}

class MyAuthenticated extends AuthState {
  MyAuthenticated({required User user}) : super(user);
}