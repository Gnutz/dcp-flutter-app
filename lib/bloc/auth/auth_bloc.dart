import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/data/services/i_gallery_service.dart';
import 'package:digtial_costume_platform/data/services/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/presentation/routes/navigation_service.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService _authService;
  final IGalleryService _galleryService;

  AuthBloc(this._authService, this._galleryService) : super(UnAuthenticated());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(checkRequested: (e) async* {
      final user = await _authService.getCurrentUser();
      yield _authenticate(user);
    }, signOut: (e) async* {
      await _authService.signOut();
      yield UnAuthenticated();
      NavigationService.instance!.pushNamedAndRemoveUntil(
          Routes.splashPage, ModalRoute.withName(Routes.splashPage));
    });
  }

  AuthState _authenticate(User? user) {
    if (user != null) {
      _galleryService.setInstitution(user.institution);
      return MyAuthenticated(user: user);
    } else {
      return UnAuthenticated();
    }
  }
}
