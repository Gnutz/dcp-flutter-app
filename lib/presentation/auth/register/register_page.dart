import 'package:digtial_costume_platform/application/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/auth/register/register_form.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColorTheme.appBarBackgroundColor,
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.signUp),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.signIn);
              },
              icon: const Icon(
                Icons.person,
                color: MyColorTheme.buttonTextColor,
              ),
              label: Text(
                AppLocalizations.of(context)!.signIn,
                style: const TextStyle(color: MyColorTheme.buttonTextColor),
              )),
        ],
      ),
      body: BlocProvider(create: (context) => Locator().locator<RegisterBloc>(),
          child: RegisterForm()),

    );
  }
}

