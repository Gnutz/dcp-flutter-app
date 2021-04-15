import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/presentation/auth/register/register_page.dart';
import 'package:digtial_costume_platform/presentation/auth/sign_in/sign_in_page.dart';
import 'package:digtial_costume_platform/presentation/costume/details/details_page.dart';
import 'package:digtial_costume_platform/presentation/gallery/category_selection.dart';
import 'package:digtial_costume_platform/presentation/gallery/gallery.dart';
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

  static get instance => _navigatorKey.currentState;
}

class AppRouter {
  Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case Routes.costumesEdit:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
        //case Routes.costumeDetails:
        return MaterialPageRoute(
            builder: (_) => DetailsPage(
                  costume: Costume(),
                ));
      case Routes.categorySelection:
        return MaterialPageRoute(builder: (_) => CategorySelectionPage());
      case Routes.gallery:
        {
          final query = settings.arguments as CostumeQuery;
          return MaterialPageRoute(builder: (_) => GalleryPage(query: query));
        }
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Page not found"),
    );
  }
}
