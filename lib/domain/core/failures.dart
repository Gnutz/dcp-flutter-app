import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({required T failedValue}) =
      InvalidEmail<T>;

  const factory ValueFailure.shortPassword({required T failedValue}) =
      ShortPassword<T>;

  const factory ValueFailure.passwordMissingUppercaseCharacter(
      {required T failedValue}) = PasswordMissingUppercaseCharacter<T>;

  const factory ValueFailure.passwordMissingLowercaseCharacter(
      {required T failedValue}) = PasswordMissingLowercaseCharacter<T>;

  const factory ValueFailure.passwordMissingNumericCharacter(
      {required T failedValue}) = PasswordMissingNumericCharacter<T>;

  const factory ValueFailure.passwordMissingSpecialCharacter(
      {required T failedValue}) = PasswordMissingSpecialCharacter<T>;
}
