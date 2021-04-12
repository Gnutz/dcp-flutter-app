import 'package:digtial_costume_platform/application/auth/auth_bloc.dart';
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
        context.read<AuthBloc>().add(const AuthEvent.checkRequested());
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
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Widget _buildEmailInput(BuildContext context, SignInState state) {
    final bloc = context.read<SignInBloc>();

    return InputField(
        hintText: AppLocalizations.of(context)!.email,
        validator: (_) =>
            validateEmailAddress(context, bloc.state.emailAddress),
        onChanged: (val) => bloc.add(SignInEvent.emailChanged(val)));
  }

  Widget _buildPasswordInput(BuildContext context, SignInState state) {
    final bloc = context.read<SignInBloc>();

    return TextFormField(
        cursorColor: Colors.pink,
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context)!.password, errorMaxLines: 5),
        obscureText: true,
        validator: (_) => validatePassword(context, bloc.state.password),
        onChanged: (val) => bloc.add(SignInEvent.passwordChanged(val)));
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context
              .read<SignInBloc>()
              .add(const SignInEvent.signInWithEmailAndPasswordPressed());
        },
        //color: Colors.pink[400],
        child: Text(AppLocalizations.of(context)!.signIn,
            style: const TextStyle(color: Colors.white)));
  }
}
