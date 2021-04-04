part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState(
      {required String name,
      required String emailAddress,
      required String password,
      required String passwordConfirmation,
      required UserRole role,
      Institution? institution,
      required bool userAgreementAccepted,
      required bool isSubmitting,
      AuthFailure? authFailureOrSuccessOption,
      required bool showInputErrorMessages}) = _RegisterState;

  factory RegisterState.initial() => const RegisterState(
      name: "",
      emailAddress: "",
      password: "",
      passwordConfirmation: "",
      role: UserRole.creative,
      institution: null,
      userAgreementAccepted: false,
      isSubmitting: false,
      authFailureOrSuccessOption: null,
      showInputErrorMessages: false);
}
