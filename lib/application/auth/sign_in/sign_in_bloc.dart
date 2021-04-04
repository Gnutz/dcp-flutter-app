import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/auth/auth_failures.dart';
import 'package:digtial_costume_platform/domain/auth/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/core/value_validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in_bloc.freezed.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthService _auth;

  SignInBloc(this._auth) : super(SignInState.initial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    yield* event.map(emailChanged: (e) async* {
      yield _emailChangedEventHandler(e);
    }, passwordChanged: (e) async* {
      yield _passwordChangedEventHandler(e);
    }, registerNavPressed: (e) async* {
      yield _registerNavEventHandler(e);
    }, signInWithEmailAndPasswordPressed: (e) async* {
      yield* _signInSubmitHandler();
    });
  }

  SignInState _passwordChangedEventHandler(PasswordChanged e) {
    return state.copyWith(
      password: e.password,
      authFailureOrSuccessOption: null,
    );
  }

  SignInState _emailChangedEventHandler(EmailChanged e) {
    return state.copyWith(
      emailAddress: e.email,
      authFailureOrSuccessOption: null,
    );
  }

  Stream<SignInState> _signInSubmitHandler() async* {
    AuthFailure? failureOrSuccess;

    final isEmailValid =
        EmailDomainValidator.validateEmailAddress(state.emailAddress);
    final isPasswordValid =
        PasswordDomainValidator.validatePassword(state.password);

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: null);

      //TODO: clean Up
      failureOrSuccess = await _auth.signInWithEmailAndPassword(
          email: state.emailAddress, password: state.password);

      yield state.copyWith(
          isSubmitting: false, authFailureOrSuccessOption: failureOrSuccess);
    }

    print('yeeeee');

    yield state.copyWith(
        isSubmitting: false,
        showInputErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess);
  }

  SignInState _registerNavEventHandler(RegisterNavPressed e) {
    //TODO: implement
    return SignInState.initial();
  }
}
