import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/auth/auth_failures.dart';
import 'package:digtial_costume_platform/domain/auth/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/value_validators.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthService _auth;

  RegisterBloc(this._auth) : super(RegisterState.initial()) {
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
      authFailureOrSuccessOption: null,
    );
  }

  RegisterState _emailChangedEventHandler(EmailChanged e) {
    return state.copyWith(
      emailAddress: e.email,
      authFailureOrSuccessOption: null,
    );
  }

  RegisterState _passwordChangedEventHandler(PasswordChanged e) {
    return state.copyWith(
      password: e.password,
      authFailureOrSuccessOption: null,
    );
  }

  RegisterState _passwordConfirmationChangedEventHandler(
      PasswordConfirmedChanged e) {
    return state.copyWith(
      passwordConfirmation: e.passwordConfirmation,
      authFailureOrSuccessOption: null,
    );
  }

  RegisterState _institutionSelectedEventHandler(InstitutionSelected e) {
    return state.copyWith(
      institution: e.institution,
      authFailureOrSuccessOption: null,
    );
  }

  RegisterState _roleSelectedEventHandler(RoleSelected e) {
    return state.copyWith(
      role: e.role,
      authFailureOrSuccessOption: null,
    );
  }

  RegisterState _userAgreementAcceptedEventHandler() {
    return state.copyWith(
      userAgreementAccepted: !state.userAgreementAccepted,
      authFailureOrSuccessOption: null,
    );
  }

  void _signInNavEventHandler() {
    NavigationService.instance!.pushReplacementNamed(Routes.signIn);
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
          isSubmitting: true, authFailureOrSuccessOption: null);
      failureOrSuccess = await _auth.registerUser(
          name: state.name,
          email: state.emailAddress,
          password: state.password,
          institution: state.institution!,
          role: state.role);

      yield state.copyWith(
          isSubmitting: false, authFailureOrSuccessOption: failureOrSuccess);
    }

    if (failureOrSuccess == null) {
      add(RegisterEvent.signInNavPressed());
    }

    yield state.copyWith(
        isSubmitting: false,
        showInputErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess);
  }

  Stream<RegisterState> _loadInstitutionsEventHandler() async* {
    final institutions = await _auth.getInstitutions();
    yield state.copyWith(institutions: institutions);
  }
}
