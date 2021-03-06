import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/auth/auth_failures.dart';
import 'package:digtial_costume_platform/data/services/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/value_validators.dart';
import 'package:digtial_costume_platform/presentation/routes/navigation_service.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthService _auth;
  final NavigationService _navigation;

  RegisterBloc(this._auth, this._navigation) : super(RegisterState.initial()) {
    add(const RegisterEvent.loadInstitutions());
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    yield* event.map(nameChanged: (e) async* {
      yield _nameChangedEventHandler(e);
    }, emailChanged: (e) async* {
      yield _emailChangedEventHandler(e);
    }, passwordChanged: (e) async* {
      yield _passwordChangedEventHandler(e);
    }, passwordConfirmed: (e) async* {
      yield _passwordConfirmationChangedEventHandler(e);
    }, institutionSelected: (e) async* {
      yield _institutionSelectedEventHandler(e);
    }, roleSelected: (e) async* {
      yield _roleSelectedEventHandler(e);
    }, userAgreementAcceptToggle: (e) async* {
      yield _userAgreementAcceptedEventHandler();
    }, signInNavPressed: (_) async* {
      _signInNavEventHandler();
    }, registerWithFormFilledPressed: (e) async* {
      yield* _registerSubmitEventHandler(e);
    }, loadInstitutions: (LoadInstitutions e) async* {
      yield* _loadInstitutionsEventHandler();
    });
  }

  RegisterState _nameChangedEventHandler(NameChanged e) {
    return state.copyWith(
      name: e.name,
      authFailureOption: null,
    );
  }

  RegisterState _emailChangedEventHandler(EmailChanged e) {
    return state.copyWith(
      emailAddress: e.email,
      authFailureOption: null,
    );
  }

  RegisterState _passwordChangedEventHandler(PasswordChanged e) {
    return state.copyWith(
      password: e.password,
      authFailureOption: null,
    );
  }

  RegisterState _passwordConfirmationChangedEventHandler(
      PasswordConfirmedChanged e) {
    return state.copyWith(
      passwordConfirmation: e.passwordConfirmation,
      authFailureOption: null,
    );
  }

  RegisterState _institutionSelectedEventHandler(InstitutionSelected e) {
    return state.copyWith(
      institution: e.institution,
      authFailureOption: null,
    );
  }

  RegisterState _roleSelectedEventHandler(RoleSelected e) {
    return state.copyWith(
      role: e.role,
      authFailureOption: null,
    );
  }

  RegisterState _userAgreementAcceptedEventHandler() {
    return state.copyWith(
      userAgreementAccepted: !state.userAgreementAccepted,
      authFailureOption: null,
    );
  }

  void _signInNavEventHandler() {
    _navigation.pushReplacementNamed(Routes.signIn);
  }

  Stream<RegisterState> _registerSubmitEventHandler(
      RegisterWithFormFilledPressed e) async* {
    AuthFailure? failureOrSuccess;

    final isEmailValid =
        EmailDomainValidator.validateEmailAddress(state.emailAddress);
    final isPasswordValid =
        PasswordDomainValidator.validatePassword(state.password);

    final institutionSelected = state.institution != null;

    if (isEmailValid && isPasswordValid && institutionSelected) {
      yield state.copyWith(
          isSubmitting: true, authFailureOption: null);

      failureOrSuccess = await _auth.registerUser(
          name: state.name,
          email: state.emailAddress,
          password: state.password,
          institution: state.institution!,
          role: state.role);

      if (failureOrSuccess == null) {
        add(const RegisterEvent.signInNavPressed());
      }
    }

    //error state display
    yield state.copyWith(
        isSubmitting: false,
        showInputErrorMessages: true,
        authFailureOption: failureOrSuccess);
  }

  Stream<RegisterState> _loadInstitutionsEventHandler() async* {
    final institutions = await _auth.getInstitutions();
    if(institutions.isNotEmpty) yield state.copyWith(institutions: institutions);
  }
}
