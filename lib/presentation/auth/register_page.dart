/*
import 'package:digtial_costume_platform/application/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/presentation/auth/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../locator.dart';

class RegisterPage extends StatelessWidget {
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
      body: BlocProvider(create: (context) => Locator().locator<RegisterBloc>(),
          child: RegisterForm()),

    );
  }
}
*/
