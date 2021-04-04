import 'package:digtial_costume_platform/application/auth/sign_in/sign_in_bloc.dart';
import 'package:digtial_costume_platform/presentation/auth/validators.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
      if (state.authFailureOrSuccessOption != null) {
        state.authFailureOrSuccessOption!.map(
          serverError: (_) => print("serverError"),
          emailInUse: (_) => print("mailInUse"),
          invalidEmailAndPasswordCombination: (_) => print("wrongCombination"),
        );
      } else {
        //TODO: navigate
      }
    }, builder: (context, state) {
      return Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            autovalidate: state.showInputErrorMessages,
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    _buildEmailInput(context, state),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _buildPasswordInput(context, state),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _buildSubmitButton(context),
                    const SizedBox(height: 12.0),
                    //_buildErrorDisplay()
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Widget _buildEmailInput(BuildContext context, SignInState state) {
    return InputField(
        hintText: AppLocalizations.of(context)!.email,
        validator: (_) => validateEmailAddress(context, state.emailAddress),
        onChanged: (val) =>
            context.read<SignInBloc>().add(SignInEvent.emailChanged(val)));
  }

  Widget _buildPasswordInput(BuildContext context, SignInState state) {
    return InputField(
        hintText: AppLocalizations.of(context)!.password,
        obscureText: true,
        validator: (_) => validatePassword(context, state.password),
        onChanged: (val) =>
            context.read<SignInBloc>().add(SignInEvent.passwordChanged(val)));
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print('pressed');
          context
              .read<SignInBloc>()
              .add(SignInEvent.signInWithEmailAndPasswordPressed());
        },
        //color: Colors.pink[400],
        child: Text(AppLocalizations.of(context)!.signIn,
            style: const TextStyle(color: Colors.white)));
  }

  Widget _buildErrorDisplay() {
    return Text(
      "error",
      style: const TextStyle(color: Colors.red, fontSize: 14.0),
    );
  }
}
