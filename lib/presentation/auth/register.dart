import 'package:digtial_costume_platform/services/auth.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:digtial_costume_platform/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _roles = <String>['Creative', 'Creator'];
  final _institutions = <String>["Aarhus Teater"];

  var name = "";
  var email = "";
  var password = "";
  var passwordConfirmation = "";
  var error = "";
  var loading = false;
  String selectedRole = "Creative";
  String selectedInstitution;
  bool consentToStoreUserData = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text(AppLocalizations.of(context).signUp),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: const Icon(Icons.person),
                    label: Text(AppLocalizations.of(context).signIn))
              ],
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildNameInput(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildEmailInput(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildPasswordInput(),
                          const SizedBox(height: 20.0),
                          _buildPasswordConfirmationInput(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildRoleSelection(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildInstitutionSelection(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CheckboxListTile(
                            title: Text(AppLocalizations.of(context)
                                .userDataStorageConsentOptInMessage),
                            value: consentToStoreUserData,
                            onChanged: (newValue) => setState(() =>
                                consentToStoreUserData =
                                    !consentToStoreUserData),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            onPressed: consentToStoreUserData
                                ? () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      final dynamic result = await _auth
                                          .registerWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              "please supply a valid email"; //TODO: change this
                                          loading = false;
                                        });
                                      }
                                    }
                                  }
                                : null,
                            //color: Colors.pink[400],
                            child: Text(AppLocalizations.of(context).signUp,
                                style: const TextStyle(color: Colors.white)),
                            //disabledColor: Colors.cyan,
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            error,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          );
  }

  Widget _buildNameInput() {
    return InputField(
      hintText: AppLocalizations.of(context).yourName,
      validator: (val) =>
          val.isEmpty ? AppLocalizations.of(context).enterAName : null,
      onChanged: (val) {
        setState(() => name = val);
      },
    );
  }

  Widget _buildEmailInput() {
    return InputField(
      hintText: AppLocalizations.of(context).email,
      validator: (val) =>
          val.isEmpty ? AppLocalizations.of(context).enterAnEmail : null,
      onChanged: (val) => setState(() => email = val),
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
        cursorColor: Colors.pink,
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context).password, errorMaxLines: 5),
        validator: (val) => _validatePassword(),
        obscureText: true,
        onChanged: (val) => setState(() => password = val));
  }

  Widget _buildPasswordConfirmationInput() {
    return InputField(
      hintText: AppLocalizations.of(context).passwordConfirmation,
      validator: (val) => passwordConfirmation != password
          ? AppLocalizations.of(context).passwordsMustBeIdentical
          : null,
      obscureText: true,
      onChanged: (val) {
        setState(() => passwordConfirmation = val);
      },
    );
  }

  Widget _buildRoleSelection() {
    return DropdownButtonFormField<String>(
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context).selectRole),
        items: _roles
            .map((role) => DropdownMenuItem(value: role, child: Text(role)))
            .toList(),
        validator: (val) => selectedRole == null
            ? AppLocalizations.of(context).selectRole
            : null,
        onChanged: (role) {
          setState(() {
            selectedRole = role;
          });
        },
        value: selectedRole);
  }

  Widget _buildInstitutionSelection() {
    return DropdownButtonFormField<String>(
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context).selectYourInstitution),
        validator: (val) => selectedInstitution == null
            ? AppLocalizations.of(context).youMustSelectYourInstitution
            : null,
        items: _institutions
            .map((institution) =>
                DropdownMenuItem(value: institution, child: Text(institution)))
            .toList(),
        onChanged: (institution) {
          setState(() {
            selectedInstitution = institution;
          });
        },
        value: selectedInstitution);
  }

  String _validatePassword() {
    //https://dzone.com/articles/use-regex-test-password

    var errorMessage = "";

    const atLeastOneLowerCaseCharacterRegex = r"""^(?=.*[a-z])""";
    if (!RegExp(atLeastOneLowerCaseCharacterRegex).hasMatch(password)) {
      errorMessage +=
          "* ${AppLocalizations.of(context).passwordMustContainOneLowercaseCharacter}\n";
    }

    const atLeastOneUpperCaseCharacterRegex = r"""^(?=.*[A-Z])""";
    if (!RegExp(atLeastOneUpperCaseCharacterRegex).hasMatch(password)) {
      errorMessage +=
          "* ${AppLocalizations.of(context).passwordMustContainOneUppercaseCharacter}\n";
    }

    const atLeastOneNumericCharacterRegex = r"""^(?=.*[0-9])""";
    if (!RegExp(atLeastOneNumericCharacterRegex).hasMatch(password)) {
      errorMessage +=
          "* ${AppLocalizations.of(context).passwordMustContainOneNumericCharacter}\n";
    }

    const atLeastOneSpecialCharacterRegex = r"""^(?=.*[!@#\$%\^&\*])""";
    if (!RegExp(atLeastOneSpecialCharacterRegex).hasMatch(password)) {
      errorMessage +=
          "* ${AppLocalizations.of(context).passwordMustContainOneOneSpecialCharacter}\n";
    }

    const atLeastEightCharacterLongRegex = r"""^(?=.{8,})""";
    if (!RegExp(atLeastEightCharacterLongRegex).hasMatch(password)) {
      errorMessage +=
          "* ${AppLocalizations.of(context).passwordMustBeAtLeastEightCharacterLong}\n";
    }

    return errorMessage.isEmpty ? null : errorMessage;
  }
}
