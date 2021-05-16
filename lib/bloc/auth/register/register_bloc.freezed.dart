// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterEventTearOff {
  const _$RegisterEventTearOff();

  NameChanged nameChanged(String name) {
    return NameChanged(
      name,
    );
  }

  EmailChanged emailChanged(String email) {
    return EmailChanged(
      email,
    );
  }

  PasswordChanged passwordChanged(String password) {
    return PasswordChanged(
      password,
    );
  }

  PasswordConfirmedChanged passwordConfirmed(String passwordConfirmation) {
    return PasswordConfirmedChanged(
      passwordConfirmation,
    );
  }

  InstitutionSelected institutionSelected(Institution institution) {
    return InstitutionSelected(
      institution,
    );
  }

  RoleSelected roleSelected(UserRole role) {
    return RoleSelected(
      role,
    );
  }

  UserAgreementAcceptToggle userAgreementAcceptToggle() {
    return const UserAgreementAcceptToggle();
  }

  SignInNavPressed signInNavPressed() {
    return const SignInNavPressed();
  }

  RegisterWithFormFilledPressed registerWithFormFilledPressed() {
    return const RegisterWithFormFilledPressed();
  }

  LoadInstitutions loadInstitutions() {
    return const LoadInstitutions();
  }
}

/// @nodoc
const $RegisterEvent = _$RegisterEventTearOff();

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  final RegisterEvent _value;
  // ignore: unused_field
  final $Res Function(RegisterEvent) _then;
}

/// @nodoc
abstract class $NameChangedCopyWith<$Res> {
  factory $NameChangedCopyWith(
          NameChanged value, $Res Function(NameChanged) then) =
      _$NameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$NameChangedCopyWithImpl<$Res> extends _$RegisterEventCopyWithImpl<$Res>
    implements $NameChangedCopyWith<$Res> {
  _$NameChangedCopyWithImpl(
      NameChanged _value, $Res Function(NameChanged) _then)
      : super(_value, (v) => _then(v as NameChanged));

  @override
  NameChanged get _value => super._value as NameChanged;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(NameChanged(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameChanged implements NameChanged {
  const _$NameChanged(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'RegisterEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NameChanged &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  $NameChangedCopyWith<NameChanged> get copyWith =>
      _$NameChangedCopyWithImpl<NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class NameChanged implements RegisterEvent {
  const factory NameChanged(String name) = _$NameChanged;

  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameChangedCopyWith<NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res> extends _$RegisterEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(EmailChanged(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements RegisterEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(PasswordChanged(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements RegisterEvent {
  const factory PasswordChanged(String password) = _$PasswordChanged;

  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordConfirmedChangedCopyWith<$Res> {
  factory $PasswordConfirmedChangedCopyWith(PasswordConfirmedChanged value,
          $Res Function(PasswordConfirmedChanged) then) =
      _$PasswordConfirmedChangedCopyWithImpl<$Res>;
  $Res call({String passwordConfirmation});
}

/// @nodoc
class _$PasswordConfirmedChangedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $PasswordConfirmedChangedCopyWith<$Res> {
  _$PasswordConfirmedChangedCopyWithImpl(PasswordConfirmedChanged _value,
      $Res Function(PasswordConfirmedChanged) _then)
      : super(_value, (v) => _then(v as PasswordConfirmedChanged));

  @override
  PasswordConfirmedChanged get _value =>
      super._value as PasswordConfirmedChanged;

  @override
  $Res call({
    Object? passwordConfirmation = freezed,
  }) {
    return _then(PasswordConfirmedChanged(
      passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordConfirmedChanged implements PasswordConfirmedChanged {
  const _$PasswordConfirmedChanged(this.passwordConfirmation);

  @override
  final String passwordConfirmation;

  @override
  String toString() {
    return 'RegisterEvent.passwordConfirmed(passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordConfirmedChanged &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                const DeepCollectionEquality()
                    .equals(other.passwordConfirmation, passwordConfirmation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(passwordConfirmation);

  @JsonKey(ignore: true)
  @override
  $PasswordConfirmedChangedCopyWith<PasswordConfirmedChanged> get copyWith =>
      _$PasswordConfirmedChangedCopyWithImpl<PasswordConfirmedChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return passwordConfirmed(passwordConfirmation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (passwordConfirmed != null) {
      return passwordConfirmed(passwordConfirmation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return passwordConfirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (passwordConfirmed != null) {
      return passwordConfirmed(this);
    }
    return orElse();
  }
}

abstract class PasswordConfirmedChanged implements RegisterEvent {
  const factory PasswordConfirmedChanged(String passwordConfirmation) =
      _$PasswordConfirmedChanged;

  String get passwordConfirmation => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordConfirmedChangedCopyWith<PasswordConfirmedChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionSelectedCopyWith<$Res> {
  factory $InstitutionSelectedCopyWith(
          InstitutionSelected value, $Res Function(InstitutionSelected) then) =
      _$InstitutionSelectedCopyWithImpl<$Res>;
  $Res call({Institution institution});
}

/// @nodoc
class _$InstitutionSelectedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $InstitutionSelectedCopyWith<$Res> {
  _$InstitutionSelectedCopyWithImpl(
      InstitutionSelected _value, $Res Function(InstitutionSelected) _then)
      : super(_value, (v) => _then(v as InstitutionSelected));

  @override
  InstitutionSelected get _value => super._value as InstitutionSelected;

  @override
  $Res call({
    Object? institution = freezed,
  }) {
    return _then(InstitutionSelected(
      institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution,
    ));
  }
}

/// @nodoc

class _$InstitutionSelected implements InstitutionSelected {
  const _$InstitutionSelected(this.institution);

  @override
  final Institution institution;

  @override
  String toString() {
    return 'RegisterEvent.institutionSelected(institution: $institution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InstitutionSelected &&
            (identical(other.institution, institution) ||
                const DeepCollectionEquality()
                    .equals(other.institution, institution)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(institution);

  @JsonKey(ignore: true)
  @override
  $InstitutionSelectedCopyWith<InstitutionSelected> get copyWith =>
      _$InstitutionSelectedCopyWithImpl<InstitutionSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return institutionSelected(institution);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (institutionSelected != null) {
      return institutionSelected(institution);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return institutionSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (institutionSelected != null) {
      return institutionSelected(this);
    }
    return orElse();
  }
}

abstract class InstitutionSelected implements RegisterEvent {
  const factory InstitutionSelected(Institution institution) =
      _$InstitutionSelected;

  Institution get institution => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstitutionSelectedCopyWith<InstitutionSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleSelectedCopyWith<$Res> {
  factory $RoleSelectedCopyWith(
          RoleSelected value, $Res Function(RoleSelected) then) =
      _$RoleSelectedCopyWithImpl<$Res>;
  $Res call({UserRole role});
}

/// @nodoc
class _$RoleSelectedCopyWithImpl<$Res> extends _$RegisterEventCopyWithImpl<$Res>
    implements $RoleSelectedCopyWith<$Res> {
  _$RoleSelectedCopyWithImpl(
      RoleSelected _value, $Res Function(RoleSelected) _then)
      : super(_value, (v) => _then(v as RoleSelected));

  @override
  RoleSelected get _value => super._value as RoleSelected;

  @override
  $Res call({
    Object? role = freezed,
  }) {
    return _then(RoleSelected(
      role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// @nodoc

class _$RoleSelected implements RoleSelected {
  const _$RoleSelected(this.role);

  @override
  final UserRole role;

  @override
  String toString() {
    return 'RegisterEvent.roleSelected(role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RoleSelected &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(role);

  @JsonKey(ignore: true)
  @override
  $RoleSelectedCopyWith<RoleSelected> get copyWith =>
      _$RoleSelectedCopyWithImpl<RoleSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return roleSelected(role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (roleSelected != null) {
      return roleSelected(role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return roleSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (roleSelected != null) {
      return roleSelected(this);
    }
    return orElse();
  }
}

abstract class RoleSelected implements RegisterEvent {
  const factory RoleSelected(UserRole role) = _$RoleSelected;

  UserRole get role => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleSelectedCopyWith<RoleSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAgreementAcceptToggleCopyWith<$Res> {
  factory $UserAgreementAcceptToggleCopyWith(UserAgreementAcceptToggle value,
          $Res Function(UserAgreementAcceptToggle) then) =
      _$UserAgreementAcceptToggleCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserAgreementAcceptToggleCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $UserAgreementAcceptToggleCopyWith<$Res> {
  _$UserAgreementAcceptToggleCopyWithImpl(UserAgreementAcceptToggle _value,
      $Res Function(UserAgreementAcceptToggle) _then)
      : super(_value, (v) => _then(v as UserAgreementAcceptToggle));

  @override
  UserAgreementAcceptToggle get _value =>
      super._value as UserAgreementAcceptToggle;
}

/// @nodoc

class _$UserAgreementAcceptToggle implements UserAgreementAcceptToggle {
  const _$UserAgreementAcceptToggle();

  @override
  String toString() {
    return 'RegisterEvent.userAgreementAcceptToggle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserAgreementAcceptToggle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return userAgreementAcceptToggle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (userAgreementAcceptToggle != null) {
      return userAgreementAcceptToggle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return userAgreementAcceptToggle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (userAgreementAcceptToggle != null) {
      return userAgreementAcceptToggle(this);
    }
    return orElse();
  }
}

abstract class UserAgreementAcceptToggle implements RegisterEvent {
  const factory UserAgreementAcceptToggle() = _$UserAgreementAcceptToggle;
}

/// @nodoc
abstract class $SignInNavPressedCopyWith<$Res> {
  factory $SignInNavPressedCopyWith(
          SignInNavPressed value, $Res Function(SignInNavPressed) then) =
      _$SignInNavPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInNavPressedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $SignInNavPressedCopyWith<$Res> {
  _$SignInNavPressedCopyWithImpl(
      SignInNavPressed _value, $Res Function(SignInNavPressed) _then)
      : super(_value, (v) => _then(v as SignInNavPressed));

  @override
  SignInNavPressed get _value => super._value as SignInNavPressed;
}

/// @nodoc

class _$SignInNavPressed implements SignInNavPressed {
  const _$SignInNavPressed();

  @override
  String toString() {
    return 'RegisterEvent.signInNavPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignInNavPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return signInNavPressed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (signInNavPressed != null) {
      return signInNavPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return signInNavPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (signInNavPressed != null) {
      return signInNavPressed(this);
    }
    return orElse();
  }
}

abstract class SignInNavPressed implements RegisterEvent {
  const factory SignInNavPressed() = _$SignInNavPressed;
}

/// @nodoc
abstract class $RegisterWithFormFilledPressedCopyWith<$Res> {
  factory $RegisterWithFormFilledPressedCopyWith(
          RegisterWithFormFilledPressed value,
          $Res Function(RegisterWithFormFilledPressed) then) =
      _$RegisterWithFormFilledPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterWithFormFilledPressedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $RegisterWithFormFilledPressedCopyWith<$Res> {
  _$RegisterWithFormFilledPressedCopyWithImpl(
      RegisterWithFormFilledPressed _value,
      $Res Function(RegisterWithFormFilledPressed) _then)
      : super(_value, (v) => _then(v as RegisterWithFormFilledPressed));

  @override
  RegisterWithFormFilledPressed get _value =>
      super._value as RegisterWithFormFilledPressed;
}

/// @nodoc

class _$RegisterWithFormFilledPressed implements RegisterWithFormFilledPressed {
  const _$RegisterWithFormFilledPressed();

  @override
  String toString() {
    return 'RegisterEvent.registerWithFormFilledPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegisterWithFormFilledPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return registerWithFormFilledPressed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (registerWithFormFilledPressed != null) {
      return registerWithFormFilledPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return registerWithFormFilledPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (registerWithFormFilledPressed != null) {
      return registerWithFormFilledPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterWithFormFilledPressed implements RegisterEvent {
  const factory RegisterWithFormFilledPressed() =
      _$RegisterWithFormFilledPressed;
}

/// @nodoc
abstract class $LoadInstitutionsCopyWith<$Res> {
  factory $LoadInstitutionsCopyWith(
          LoadInstitutions value, $Res Function(LoadInstitutions) then) =
      _$LoadInstitutionsCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadInstitutionsCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res>
    implements $LoadInstitutionsCopyWith<$Res> {
  _$LoadInstitutionsCopyWithImpl(
      LoadInstitutions _value, $Res Function(LoadInstitutions) _then)
      : super(_value, (v) => _then(v as LoadInstitutions));

  @override
  LoadInstitutions get _value => super._value as LoadInstitutions;
}

/// @nodoc

class _$LoadInstitutions implements LoadInstitutions {
  const _$LoadInstitutions();

  @override
  String toString() {
    return 'RegisterEvent.loadInstitutions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadInstitutions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) nameChanged,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String passwordConfirmation) passwordConfirmed,
    required TResult Function(Institution institution) institutionSelected,
    required TResult Function(UserRole role) roleSelected,
    required TResult Function() userAgreementAcceptToggle,
    required TResult Function() signInNavPressed,
    required TResult Function() registerWithFormFilledPressed,
    required TResult Function() loadInstitutions,
  }) {
    return loadInstitutions();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? nameChanged,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String passwordConfirmation)? passwordConfirmed,
    TResult Function(Institution institution)? institutionSelected,
    TResult Function(UserRole role)? roleSelected,
    TResult Function()? userAgreementAcceptToggle,
    TResult Function()? signInNavPressed,
    TResult Function()? registerWithFormFilledPressed,
    TResult Function()? loadInstitutions,
    required TResult orElse(),
  }) {
    if (loadInstitutions != null) {
      return loadInstitutions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(PasswordConfirmedChanged value) passwordConfirmed,
    required TResult Function(InstitutionSelected value) institutionSelected,
    required TResult Function(RoleSelected value) roleSelected,
    required TResult Function(UserAgreementAcceptToggle value)
        userAgreementAcceptToggle,
    required TResult Function(SignInNavPressed value) signInNavPressed,
    required TResult Function(RegisterWithFormFilledPressed value)
        registerWithFormFilledPressed,
    required TResult Function(LoadInstitutions value) loadInstitutions,
  }) {
    return loadInstitutions(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(PasswordConfirmedChanged value)? passwordConfirmed,
    TResult Function(InstitutionSelected value)? institutionSelected,
    TResult Function(RoleSelected value)? roleSelected,
    TResult Function(UserAgreementAcceptToggle value)?
        userAgreementAcceptToggle,
    TResult Function(SignInNavPressed value)? signInNavPressed,
    TResult Function(RegisterWithFormFilledPressed value)?
        registerWithFormFilledPressed,
    TResult Function(LoadInstitutions value)? loadInstitutions,
    required TResult orElse(),
  }) {
    if (loadInstitutions != null) {
      return loadInstitutions(this);
    }
    return orElse();
  }
}

abstract class LoadInstitutions implements RegisterEvent {
  const factory LoadInstitutions() = _$LoadInstitutions;
}

/// @nodoc
class _$RegisterStateTearOff {
  const _$RegisterStateTearOff();

  _RegisterState call(
      {required List<Institution> institutions,
      required String name,
      required String emailAddress,
      required String password,
      required String passwordConfirmation,
      required UserRole role,
      Institution? institution,
      required bool userAgreementAccepted,
      required bool isSubmitting,
      AuthFailure? authFailureOption,
      required bool showInputErrorMessages}) {
    return _RegisterState(
      institutions: institutions,
      name: name,
      emailAddress: emailAddress,
      password: password,
      passwordConfirmation: passwordConfirmation,
      role: role,
      institution: institution,
      userAgreementAccepted: userAgreementAccepted,
      isSubmitting: isSubmitting,
      authFailureOption: authFailureOption,
      showInputErrorMessages: showInputErrorMessages,
    );
  }
}

/// @nodoc
const $RegisterState = _$RegisterStateTearOff();

/// @nodoc
mixin _$RegisterState {
  List<Institution> get institutions => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirmation => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  Institution? get institution => throw _privateConstructorUsedError;
  bool get userAgreementAccepted => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  AuthFailure? get authFailureOption => throw _privateConstructorUsedError;
  bool get showInputErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
  $Res call(
      {List<Institution> institutions,
      String name,
      String emailAddress,
      String password,
      String passwordConfirmation,
      UserRole role,
      Institution? institution,
      bool userAgreementAccepted,
      bool isSubmitting,
      AuthFailure? authFailureOption,
      bool showInputErrorMessages});

  $AuthFailureCopyWith<$Res>? get authFailureOption;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;

  @override
  $Res call({
    Object? institutions = freezed,
    Object? name = freezed,
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? role = freezed,
    Object? institution = freezed,
    Object? userAgreementAccepted = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOption = freezed,
    Object? showInputErrorMessages = freezed,
  }) {
    return _then(_value.copyWith(
      institutions: institutions == freezed
          ? _value.institutions
          : institutions // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution?,
      userAgreementAccepted: userAgreementAccepted == freezed
          ? _value.userAgreementAccepted
          : userAgreementAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOption: authFailureOption == freezed
          ? _value.authFailureOption
          : authFailureOption // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
      showInputErrorMessages: showInputErrorMessages == freezed
          ? _value.showInputErrorMessages
          : showInputErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AuthFailureCopyWith<$Res>? get authFailureOption {
    if (_value.authFailureOption == null) {
      return null;
    }

    return $AuthFailureCopyWith<$Res>(_value.authFailureOption!, (value) {
      return _then(_value.copyWith(authFailureOption: value));
    });
  }
}

/// @nodoc
abstract class _$RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(
          _RegisterState value, $Res Function(_RegisterState) then) =
      __$RegisterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Institution> institutions,
      String name,
      String emailAddress,
      String password,
      String passwordConfirmation,
      UserRole role,
      Institution? institution,
      bool userAgreementAccepted,
      bool isSubmitting,
      AuthFailure? authFailureOption,
      bool showInputErrorMessages});

  @override
  $AuthFailureCopyWith<$Res>? get authFailureOption;
}

/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(
      _RegisterState _value, $Res Function(_RegisterState) _then)
      : super(_value, (v) => _then(v as _RegisterState));

  @override
  _RegisterState get _value => super._value as _RegisterState;

  @override
  $Res call({
    Object? institutions = freezed,
    Object? name = freezed,
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? role = freezed,
    Object? institution = freezed,
    Object? userAgreementAccepted = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOption = freezed,
    Object? showInputErrorMessages = freezed,
  }) {
    return _then(_RegisterState(
      institutions: institutions == freezed
          ? _value.institutions
          : institutions // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution?,
      userAgreementAccepted: userAgreementAccepted == freezed
          ? _value.userAgreementAccepted
          : userAgreementAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOption: authFailureOption == freezed
          ? _value.authFailureOption
          : authFailureOption // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
      showInputErrorMessages: showInputErrorMessages == freezed
          ? _value.showInputErrorMessages
          : showInputErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  const _$_RegisterState(
      {required this.institutions,
      required this.name,
      required this.emailAddress,
      required this.password,
      required this.passwordConfirmation,
      required this.role,
      this.institution,
      required this.userAgreementAccepted,
      required this.isSubmitting,
      this.authFailureOption,
      required this.showInputErrorMessages});

  @override
  final List<Institution> institutions;
  @override
  final String name;
  @override
  final String emailAddress;
  @override
  final String password;
  @override
  final String passwordConfirmation;
  @override
  final UserRole role;
  @override
  final Institution? institution;
  @override
  final bool userAgreementAccepted;
  @override
  final bool isSubmitting;
  @override
  final AuthFailure? authFailureOption;
  @override
  final bool showInputErrorMessages;

  @override
  String toString() {
    return 'RegisterState(institutions: $institutions, name: $name, emailAddress: $emailAddress, password: $password, passwordConfirmation: $passwordConfirmation, role: $role, institution: $institution, userAgreementAccepted: $userAgreementAccepted, isSubmitting: $isSubmitting, authFailureOption: $authFailureOption, showInputErrorMessages: $showInputErrorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterState &&
            (identical(other.institutions, institutions) ||
                const DeepCollectionEquality()
                    .equals(other.institutions, institutions)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                const DeepCollectionEquality().equals(
                    other.passwordConfirmation, passwordConfirmation)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.institution, institution) ||
                const DeepCollectionEquality()
                    .equals(other.institution, institution)) &&
            (identical(other.userAgreementAccepted, userAgreementAccepted) ||
                const DeepCollectionEquality().equals(
                    other.userAgreementAccepted, userAgreementAccepted)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.authFailureOption, authFailureOption) ||
                const DeepCollectionEquality()
                    .equals(other.authFailureOption, authFailureOption)) &&
            (identical(other.showInputErrorMessages, showInputErrorMessages) ||
                const DeepCollectionEquality().equals(
                    other.showInputErrorMessages, showInputErrorMessages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(institutions) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(passwordConfirmation) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(institution) ^
      const DeepCollectionEquality().hash(userAgreementAccepted) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOption) ^
      const DeepCollectionEquality().hash(showInputErrorMessages);

  @JsonKey(ignore: true)
  @override
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
      {required List<Institution> institutions,
      required String name,
      required String emailAddress,
      required String password,
      required String passwordConfirmation,
      required UserRole role,
      Institution? institution,
      required bool userAgreementAccepted,
      required bool isSubmitting,
      AuthFailure? authFailureOption,
      required bool showInputErrorMessages}) = _$_RegisterState;

  @override
  List<Institution> get institutions => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get emailAddress => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get passwordConfirmation => throw _privateConstructorUsedError;
  @override
  UserRole get role => throw _privateConstructorUsedError;
  @override
  Institution? get institution => throw _privateConstructorUsedError;
  @override
  bool get userAgreementAccepted => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  AuthFailure? get authFailureOption => throw _privateConstructorUsedError;
  @override
  bool get showInputErrorMessages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
