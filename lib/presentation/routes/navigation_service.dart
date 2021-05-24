import 'package:flutter/material.dart';


class NavigationService {
  static final GlobalKey<NavigatorState> _navigatorKey =
  GlobalKey<NavigatorState>();



  static String? get currentRoute {
  try {

  return ModalRoute.of(currentContext!)!.settings.name;
  } catch (e) {
  return null;
  }
  }

  static NavigatorState? get instance => _navigatorKey.currentState;

  static BuildContext? get currentContext => key.currentState?.overlay?.context;

  static GlobalKey<NavigatorState> get key => _navigatorKey;

  Future<dynamic> pushReplacementNamed(String route){
    return _navigatorKey.currentState!.pushReplacementNamed(route);
  }
}
