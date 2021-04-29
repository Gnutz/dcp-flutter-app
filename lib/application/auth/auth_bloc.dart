import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/auth/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService _authService;

  AuthBloc(this._authService) : super(UnAuthenticated());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(checkRequested: (e) async* {
      final user = await _authService.getCurrentUser();
      yield user != null ? MyAuthenticated(user: user) : UnAuthenticated();
    }, signOut: (e) async* {
      await _authService.signOut();
      yield UnAuthenticated();
      NavigationService.instance!.pushNamedAndRemoveUntil(
          Routes.splashPage, ModalRoute.withName(Routes.splashPage));
    });
  }
}

