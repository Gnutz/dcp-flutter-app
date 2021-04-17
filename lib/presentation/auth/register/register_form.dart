import 'package:digtial_costume_platform/application/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/presentation/auth/validators.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterForm extends StatelessWidget {
  //TODO: GRAP FROM SERVER
  final _institutions = <Institution>[
    Institution(
        uid: "fHEEOUrR8ZcsqbH19dzC",
        alias: "AT",
        domain: "@at",
        name: "Aarhus Teater")
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.authFailureOrSuccessOption != null) {
          state.authFailureOrSuccessOption!.map(
            serverError: (_) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(AppLocalizations.of(context)!.errorServer))),
            emailInUse: (_) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text(AppLocalizations.of(context)!.errorEmailInUse))),
            invalidEmailAndPasswordCombination: (_) =>
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(AppLocalizations.of(context)!
                        .errorInvalidCombination))),
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
              autovalidateMode: AutovalidateMode.always,
              //TODO:
              // autovalidate: state.showInputErrorMessages,
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
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget _buildNameInput(BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();

    return InputField(
        hintText: AppLocalizations.of(context)!.yourName,
        validator: (_) => bloc.state.name.isEmpty
            ? AppLocalizations.of(context)!.enterAName
            : null,
        onChanged: (val) => bloc.add(RegisterEvent.nameChanged(val)));
  }

  Widget _buildEmailInput(BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();

    return InputField(
        hintText: AppLocalizations.of(context)!.email,
        validator: (_) =>
            validateEmailAddress(context, bloc.state.emailAddress),
        onChanged: (val) => bloc.add(RegisterEvent.emailChanged(val)));
  }

  Widget _buildPasswordInput(BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();

    return TextFormField(
        cursorColor: MyColorTheme.textFormFieldCursorColor,
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context)!.password, errorMaxLines: 5),
        obscureText: true,
        validator: (_) => validatePassword(context, bloc.state.password),
        onChanged: (val) => bloc.add(RegisterEvent.passwordChanged(val)));
  }

  Widget _buildPasswordConfirmationInput(
      BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();

    return InputField(
        hintText: AppLocalizations.of(context)!.passwordConfirmation,
        validator: (val) =>
            bloc.state.password == bloc.state.passwordConfirmation
                ? AppLocalizations.of(context)!.passwordsMustBeIdentical
                : null,
        obscureText: true,
        onChanged: (val) => bloc.add(RegisterEvent.passwordConfirmed(val)));
  }

  Widget _buildRoleSelection(BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();

    return DropdownButtonFormField<UserRole>(
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(context)!.selectRole),
        value: bloc.state.role,
        items: UserRole.values
            .where((role) => role != UserRole.admin)
            .map((UserRole role) => _mapUserRoleToDropDownItem(context, role))
            .toList(),
        onChanged: (val) => bloc.add(RegisterEvent.roleSelected(val!)));
  }

  DropdownMenuItem<UserRole> _mapUserRoleToDropDownItem(
      BuildContext context, UserRole role) {
    switch (role) {
      case UserRole.creative:
        return DropdownMenuItem<UserRole>(
            value: role, child: Text(AppLocalizations.of(context)!.creative));
      case UserRole.creator:
        return DropdownMenuItem<UserRole>(
            value: role, child: Text(AppLocalizations.of(context)!.creator));
      case UserRole.admin:
        return DropdownMenuItem<UserRole>(
            value: role, child: Text(AppLocalizations.of(context)!.admin));
    }
  }

  Widget _buildInstitutionSelection(BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();

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
        onChanged: (val) => bloc.add(RegisterEvent.institutionSelected(val!)),
        value: bloc.state.institution);
  }

  Widget _buildUserAgreementCheckBox(
      BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();

    return CheckboxListTile(
      title: Text(
          AppLocalizations.of(context)!.userDataStorageConsentOptInMessage),
      value: bloc.state.userAgreementAccepted,
      onChanged: (_) =>
          bloc.add(const RegisterEvent.userAgreementAcceptToggle()),
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: MyColorTheme.backgroundColor,
      activeColor: MyColorTheme.buttonColor,
    );
  }

  Widget _buildSubmitButton(BuildContext context, RegisterState state) {
    final bloc = context.read<RegisterBloc>();

    return ElevatedButton(
      onPressed: bloc.state.userAgreementAccepted
          ? () => bloc.add(const RegisterEvent.registerWithFormFilledPressed())
          : null,
      style: ElevatedButton.styleFrom(primary: MyColorTheme.buttonColor),
      child: Text(AppLocalizations.of(context)!.signUp,
          style: const TextStyle(color: MyColorTheme.buttonTextColor)),
      //disabledColor: Colors.cyan,
    );
  }
}
