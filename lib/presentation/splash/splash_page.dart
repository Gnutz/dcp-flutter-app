import 'package:digtial_costume_platform/application/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.map(
              initial: (_) {},
              authenticated: (_) {
                Navigator.of(context)
                    .pushReplacementNamed(Routes.categorySelection);
              },
              unauthenticated: (_) =>
                  Navigator.of(context).pushReplacementNamed(Routes.signIn));
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
