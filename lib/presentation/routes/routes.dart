import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/presentation/auth/register/register_page.dart';
import 'package:digtial_costume_platform/presentation/auth/sign_in/sign_in_page.dart';
import 'package:digtial_costume_platform/presentation/costume/details/costume_details_page.dart';
import 'package:digtial_costume_platform/presentation/costume/edit/costume_edit_page.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/category_selection.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/gallery_page.dart';
import 'package:digtial_costume_platform/presentation/routes/navigation_service.dart';
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

// ignore: avoid_classes_with_only_static_members
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
        return MaterialPageRoute(builder: (_) => CostumeEditPage(costumeId: costumeId));
      case Routes.costumeDetails:
        // ignore: cast_nullable_to_non_nullable
        final costume = settings.arguments as Costume;
        return MaterialPageRoute(
            builder: (_) => CostumeDetailsPage(costume: costume));
      case Routes.categorySelection:
        return MaterialPageRoute(builder: (_) => CategorySelectionPage());
      case Routes.gallery:
        {
          // ignore: cast_nullable_to_non_nullable
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
    return const Scaffold(
      body: Text("Page not found"),
    );
  }
}
