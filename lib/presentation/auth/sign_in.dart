import 'package:digtial_costume_platform/services/auth.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:digtial_costume_platform/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
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
              title: const Text("Sign in"),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: const Icon(Icons.person),
                    label: const Text("Register"))
              ],
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        cursorColor: Colors.pink,
                        decoration:
                            textInputDecorator.copyWith(hintText: "email"),
                        validator: (val) =>
                            val.isEmpty ? 'enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        cursorColor: Colors.pink,
                        obscureText: true,
                        decoration:
                            textInputDecorator.copyWith(hintText: "password"),
                        validator: (val) => val.length < 6
                            ? 'enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              final dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      "could not sign in with those credentials";
                                  loading = false;
                                });
                              }
                            }
                          },
                          //color: Colors.pink[400],
                          child: const Text("sign in",
                              style: TextStyle(color: Colors.white))),
                      const SizedBox(height: 12.0),
                      Text(
                        error,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                )),
          );
  }
}
