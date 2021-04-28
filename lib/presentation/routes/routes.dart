import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/presentation/auth/register/register_page.dart';
import 'package:digtial_costume_platform/presentation/auth/sign_in/sign_in_page.dart';
import 'package:digtial_costume_platform/presentation/costume/details/costume_details_page.dart';
import 'package:digtial_costume_platform/presentation/costume/edit/costume_edit_page.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/category_selection.dart';
import 'package:digtial_costume_platform/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const splashPage = '/';
  static const signIn = 'sign-in';
  static const register = 'register';
  static const costumesEdit = "costumes/edit/";
  static const costumeDetails = "costumes/details/";
  static const categorySelection = "costume/category-selection";
  static const gallery = "costume/gallery";
}

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
}

class DialogService extends NavigationService {
  static BuildContext? get instance =>
      NavigationService.key.currentState?.overlay?.context;
}

class AppRouter {
  Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => RouteGuard());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case Routes.costumesEdit:
        final costumeId = settings.arguments as String?;
        return MaterialPageRoute(
            builder: (_) => CostumeEditPage(costumeId: costumeId));
      case Routes.costumeDetails:
        final costume = settings.arguments as Costume;
        return MaterialPageRoute(
            builder: (_) => CostumeDetailsPage(costume: costume));
      case Routes.categorySelection:
        return MaterialPageRoute(builder: (_) => CategorySelectionPage());
    /*  case Routes.gallery:
        {
          final query = settings.arguments as CostumeQuery;
          return MaterialPageRoute(builder: (_) => GalleryPage(query: query));
        } */
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Page not found"),
    );
  }
}
