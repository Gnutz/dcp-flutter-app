import 'package:digtial_costume_platform/bloc/auth/sign_in/sign_in_bloc.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/auth/sign_in/sign_in_form.dart';
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColorTheme.appBarBackgroundColor,
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.signIn),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.register);
              },
              icon: const Icon(
                Icons.person,
                color: MyColorTheme.buttonTextColor,
              ),
              label: Text(
                AppLocalizations.of(context)!.signUp,
                style: const TextStyle(color: MyColorTheme.buttonTextColor),
              ))
        ],
      ),
      body: BlocProvider(
          create: (context) => Locator().locator<SignInBloc>(),
          child: SignInForm()),
    );
  }
}

