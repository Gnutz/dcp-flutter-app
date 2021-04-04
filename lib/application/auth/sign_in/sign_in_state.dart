part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState(
      {required String emailAddress,
      required String password,
      required bool isSubmitting,
      required AuthFailure? authFailureOrSuccessOption,
      required bool showInputErrorMessages}) = _SignInState;

  factory SignInState.initial() => const SignInState(
      emailAddress: '',
      password: '',
      isSubmitting: false,
      authFailureOrSuccessOption: null,
      showInputErrorMessages: false);
}
