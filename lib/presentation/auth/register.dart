
/*
class Register extends StatefulWidget {
  final Function toggleView;

  const Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthOldService _auth = AuthOldService();
  final _formKey = GlobalKey<FormState>();
  final _roles = <String>['Creative', 'Creator'];
  final _institutions = <String>["Aarhus Teater"];

  var _name = "";
  var _email = "";
  var _password = "";
  var _passwordConfirmation = "";
  var _error = "";
  var _loading = false;
  String? selectedRole = "Creative";
  String? selectedInstitution;
  bool consentUserAgreement = false;

  @override
  Widget build(BuildContext context) {
    return
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text(AppLocalizations.of(context)!.signUp),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: const Icon(Icons.person),
                    label: Text(AppLocalizations.of(context)!.signIn))
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
                          _buildUserAgreementCheckBox(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildSubmitButton(),
                          const SizedBox(height: 12.0),
                          _buildErrorDisplay(),
                        ],
                      ),
                    ),
                  ),
                )),
          );
  }

  Widget _buildNameInput() {
    return InputField(
      hintText: AppLocalizations.of(context)!.yourName,
      validator: (val) =>
          val!.isEmpty ? AppLocalizations.of(context)!.enterAName : null,
      onChanged: (val) {
        setState(() => _name = val);
      },
    );
  }

  Widget _buildEmailInput() {
    return InputField(
      hintText: AppLocalizations.of(context)!.email,
      validator: (_) => validateEmailAddress(context, state.email)
      onChanged: (val) => setState(() => _email = val),
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
        cursorColor: Colors.pink,
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context)!.password, errorMaxLines: 5),
        validator: (_) => validatePassword(context, state.password),
        obscureText: true,
        onChanged: (val) => setState(() => _password = val));
  }

  Widget _buildPasswordConfirmationInput() {
    return InputField(
      hintText: AppLocalizations.of(context)!.passwordConfirmation,
      validator: (val) => _passwordConfirmation != _password
          ? AppLocalizations.of(context)!.passwordsMustBeIdentical
          : null,
      obscureText: true,
      onChanged: (val) {
        setState(() => _passwordConfirmation = val);
      },
    );
  }

  Widget _buildRoleSelection() {
    return DropdownButtonFormField<String>(
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context)!.selectRole),
        items: _roles
            .map((role) => DropdownMenuItem(value: role, child: Text(role)))
            .toList(),
        validator: (val) => selectedRole == null
            ? AppLocalizations.of(context)!.selectRole
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
            hintText: AppLocalizations.of(context)!.selectYourInstitution),
        validator: (val) => selectedInstitution == null
            ? AppLocalizations.of(context)!.youMustSelectYourInstitution
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

  Widget _buildUserAgreementCheckBox() {
    return CheckboxListTile(
      title: Text(
          AppLocalizations.of(context)!.userDataStorageConsentOptInMessage),
      value: consentUserAgreement,
      onChanged: (newValue) =>
          setState(() => consentUserAgreement = !consentUserAgreement),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: consentUserAgreement
          ? () async {
              if (_formKey.currentState!.validate()) {
                setState(() => _loading = true);
                final dynamic result =
                    await _auth.registerWithEmailAndPassword(_email, _password);
                if (result == null) {
                  setState(() {
                    _error = "please supply a valid email"; //TODO: change this
                    _loading = false;
                  });
                }
              }
            }
          : null,
      //color: Colors.pink[400],
      child: Text(AppLocalizations.of(context)!.signUp,
          style: const TextStyle(color: Colors.white)),
      //disabledColor: Colors.cyan,
    );
  }

  Widget _buildErrorDisplay() {
    return Text(
      _error,
      style: const TextStyle(color: Colors.red, fontSize: 14.0),
    );
  }

}

class registerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */
