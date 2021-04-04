import 'package:digtial_costume_platform/application/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/costume/institution.dart';
import 'package:digtial_costume_platform/presentation/auth/validators.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterForm extends StatelessWidget {
  //TODO: GRAP FROM SERVER
  final _institutions = <Institution>[
    Institution(uid: "1", alias: "AT", domain: "@at", name: "Aarhus Teater")
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.authFailureOrSuccessOption != null) {
          state.authFailureOrSuccessOption!.map(
            serverError: (_) => print("serverError"),
            emailInUse: (_) => print("mailInUse"),
            invalidEmailAndPasswordCombination: (_) =>
                print("wrongCombination"),
          );
        } else {
          //TODO: navigate
        }
      },
      builder: (context, state) {
        return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildNameInput(context, state),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _buildEmailInput(context, state),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _buildPasswordInput(context, state),
                      const SizedBox(height: 20.0),
                      _buildPasswordConfirmationInput(context, state),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _buildRoleSelection(context, state),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _buildInstitutionSelection(context, state),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _buildUserAgreementCheckBox(context, state),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _buildSubmitButton(context, state),
                      const SizedBox(height: 12.0),
                      _buildErrorDisplay(),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget _buildNameInput(BuildContext context, RegisterState state) {
    return InputField(
        hintText: AppLocalizations.of(context)!.yourName,
        validator: (val) =>
            val!.isEmpty ? AppLocalizations.of(context)!.enterAName : null,
        onChanged: (val) =>
            context.read<RegisterBloc>().add(RegisterEvent.nameChanged(val)));
  }

  Widget _buildEmailInput(BuildContext context, RegisterState state) {
    return InputField(
        hintText: AppLocalizations.of(context)!.email,
        validator: (_) => validateEmailAddress(context, state.emailAddress),
        onChanged: (val) =>
            context.read<RegisterBloc>().add(RegisterEvent.emailChanged(val)));
  }

  Widget _buildPasswordInput(BuildContext context, RegisterState state) {
    return InputField(
        hintText: AppLocalizations.of(context)!.password,
        obscureText: true,
        validator: (_) => validatePassword(context, state.password),
        onChanged: (val) => context
            .read<RegisterBloc>()
            .add(RegisterEvent.passwordChanged(val)));
  }

  Widget _buildPasswordConfirmationInput(
      BuildContext context, RegisterState state) {
    return InputField(
        hintText: AppLocalizations.of(context)!.passwordConfirmation,
        validator: (val) => state.password == state.passwordConfirmation
            ? AppLocalizations.of(context)!.passwordsMustBeIdentical
            : null,
        obscureText: true,
        onChanged: (val) => context
            .read<RegisterBloc>()
            .add(RegisterEvent.passwordConfirmed(val)));
  }

  Widget _buildRoleSelection(BuildContext context, RegisterState state) {
    return DropdownButtonFormField<UserRole>(
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context)!.selectRole),
        value: state.role,
        items: UserRole.values
            .map((UserRole role) => DropdownMenuItem<UserRole>(
                value: role, child: Text(role.toString())))
            .toList(),
        onChanged: (val) =>
            context.read<RegisterBloc>().add(RegisterEvent.roleSelected(val!)));
  }

  Widget _buildInstitutionSelection(BuildContext context, RegisterState state) {
    return DropdownButtonFormField<Institution>(
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context)!.selectYourInstitution),
        validator: (val) => state.institution == null
            ? AppLocalizations.of(context)!.youMustSelectYourInstitution
            : null,
        items: _institutions
            .map((Institution institution) => DropdownMenuItem<Institution>(
                  value: institution,
                  child: Text(institution.name),
                ))
            .toList(),
        onChanged: (val) => context
            .read<RegisterBloc>()
            .add(RegisterEvent.institutionSelected(val!)),
        value: state.institution);
  }

  Widget _buildUserAgreementCheckBox(
      BuildContext context, RegisterState state) {
    return CheckboxListTile(
      title: Text(
          AppLocalizations.of(context)!.userDataStorageConsentOptInMessage),
      value: state.userAgreementAccepted,
      onChanged: (_) => context
          .read<RegisterBloc>()
          .add(const RegisterEvent.userAgreementAcceptToggle()),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget _buildSubmitButton(BuildContext context, RegisterState state) {
    return ElevatedButton(
      onPressed: state.userAgreementAccepted
          ? () => context
              .read<RegisterBloc>()
              .add(const RegisterEvent.registerWithFormFilledPressed())
          : null,
      //color: Colors.pink[400],
      child: Text(AppLocalizations.of(context)!.signUp,
          style: const TextStyle(color: Colors.white)),
      //disabledColor: Colors.cyan,
    );
  }

  Widget _buildErrorDisplay() {
    return Text("");
  }
}
