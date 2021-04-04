import 'package:digtial_costume_platform/domain/core/value_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? validateEmailAddress(BuildContext context, String input) {
  final isValid = EmailDomainValidator.validateEmailAddress(input);

  return isValid ? null : AppLocalizations.of(context)!.email;
}

String? validatePassword(BuildContext context, String input) {
  //https://dzone.com/articles/use-regex-test-password

  var errorMessage = "";

  const atLeastOneLowerCaseCharacterRegex = r"""^(?=.*[a-z])""";
  if (!RegExp(atLeastOneLowerCaseCharacterRegex).hasMatch(input)) {
    errorMessage +=
        "* ${AppLocalizations.of(context)!.passwordMustContainOneLowercaseCharacter}\n";
  }

  const atLeastOneUpperCaseCharacterRegex = r"""^(?=.*[A-Z])""";
  if (!RegExp(atLeastOneUpperCaseCharacterRegex).hasMatch(input)) {
    errorMessage +=
        "* ${AppLocalizations.of(context)!.passwordMustContainOneUppercaseCharacter}\n";
  }

  const atLeastOneNumericCharacterRegex = r"""^(?=.*[0-9])""";
  if (!RegExp(atLeastOneNumericCharacterRegex).hasMatch(input)) {
    errorMessage +=
        "* ${AppLocalizations.of(context)!.passwordMustContainOneNumericCharacter}\n";
  }

  const atLeastOneSpecialCharacterRegex = r"""^(?=.*[!@#\$%\^&\*])""";
  if (!RegExp(atLeastOneSpecialCharacterRegex).hasMatch(input)) {
    errorMessage +=
        "* ${AppLocalizations.of(context)!.passwordMustContainOneOneSpecialCharacter}\n";
  }

  const atLeastEightCharacterLongRegex = r"""^(?=.{8,})""";
  if (!RegExp(atLeastEightCharacterLongRegex).hasMatch(input)) {
    errorMessage +=
        "* ${AppLocalizations.of(context)!.passwordMustBeAtLeastEightCharacterLong}\n";
  }
  return errorMessage.isEmpty ? null : errorMessage;
}
