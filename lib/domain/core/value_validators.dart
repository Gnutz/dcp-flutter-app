class EmailDomainValidator {
  static bool validateEmailAddress(String input) {
// https://resocoder.com/2020/03/13/flutter-firebase-ddd-course-2-authentication-value-objects/
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (RegExp(emailRegex).hasMatch(input)) {
      return true;
    }
    return false;
  }
}

class PasswordDomainValidator {
  static bool validatePassword(String input) {
    //https://dzone.com/articles/use-regex-test-password

    final regrexes = <String>[
      r"""^(?=.*[a-z])""",
      r"""^(?=.*[A-Z])""",
      r"""^(?=.*[0-9])""",
      r"""^(?=.*[!@#\$%\^&\*])""",
      r"""^(?=.{8,})"""
    ];

    for (final regrex in regrexes) {
      if (!RegExp(regrex).hasMatch(input)) {
        return false;
      }
    }

    return true;
  }

}