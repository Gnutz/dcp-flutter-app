import 'package:digtial_costume_platform/bloc/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is MyAuthenticated) {
            Navigator.of(context).pushNamed(Routes.categorySelection);
          } else if (state is UnAuthenticated) {
            Navigator.of(context).pushReplacementNamed(Routes.signIn);
          }
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
