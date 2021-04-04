part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.nameChanged(String name) = NameChanged;

  const factory RegisterEvent.emailChanged(String email) = EmailChanged;

  const factory RegisterEvent.passwordChanged(String password) =
      PasswordChanged;

  const factory RegisterEvent.passwordConfirmed(String passwordConfirmation) =
      PasswordConfirmedChanged;

  const factory RegisterEvent.institutionSelected(Institution institution) =
      institutionSelected;

  const factory RegisterEvent.roleSelected(UserRole role) = RoleSelected;

  const factory RegisterEvent.userAgreementAcceptToggle() =
      UserAgreementAcceptToggle;

  const factory RegisterEvent.signInNavPressed() = SignInNavPressed;

  const factory RegisterEvent.registerWithFormFilledPressed() =
      RegisterWithFormFilledPressed;
}
