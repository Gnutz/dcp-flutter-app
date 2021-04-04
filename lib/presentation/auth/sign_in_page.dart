/*
import 'package:digtial_costume_platform/services/auth.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:digtial_costume_platform/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthOldService _auth = AuthOldService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text(AppLocalizations.of(context)!.signIn),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: const Icon(Icons.person),
                    label: Text(AppLocalizations.of(context)!.signUp))
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
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildEmailInput(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildPasswordInput(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildSubmitButton(),
                          const SizedBox(height: 12.0),
                          _buildErrorDisplay()
                        ],
                      ),
                    ),
                  ),
                )),
          );
  }

  Widget _buildEmailInput() {
    return InputField(
      hintText: AppLocalizations.of(context)!.email,
      validator: (val) =>
          val!.isEmpty ? AppLocalizations.of(context)!.enterAnEmail : null,
      onChanged: (val) => setState(() => email = val),
    );
  }

  Widget _buildPasswordInput() {
    return InputField(
        hintText: AppLocalizations.of(context)!.password,
        validator: (val) => val!.length < 8
            ? AppLocalizations.of(context)!
                .passwordMustBeAtLeastEightCharacterLong
            : null,
        obscureText: true,
        onChanged: (val) => setState(() => password = val));
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            setState(() => loading = true);
            final dynamic result =
                await _auth.signInWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                error =
                    "could not sign in with those credentials"; //TODO: externalize
                loading = false;
              });
            }
          }
        },
        //color: Colors.pink[400],
        child: Text(AppLocalizations.of(context)!.signIn,
            style: const TextStyle(color: Colors.white)));
  }

  Widget _buildErrorDisplay() {
    return Text(
      error,
      style: const TextStyle(color: Colors.red, fontSize: 14.0),
    );
  }
}

 */

import 'package:digtial_costume_platform/application/auth/sign_in/sign_in_bloc.dart';
import 'package:digtial_costume_platform/presentation/auth/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../locator.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.signIn),
        actions: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person),
              label: Text(AppLocalizations.of(context)!.signUp))
        ],
      ),
      body: BlocProvider(
          create: (context) => Locator().locator<SignInBloc>(),
          child: SignInForm()),
    );
  }
}
