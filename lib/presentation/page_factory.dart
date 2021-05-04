

import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/costume/details/costume_details_bloc.dart';
import '../bloc/costume/edit/costume_form_bloc.dart';
import '../locator.dart';
import 'costume/details/costume_details_display.dart';
import 'costume/edit/costume_edit_form.dart';
import 'routes/routes.dart';

class PageFactory {

  static BlocProvider createPage(String route, dynamic? arguments) {
    switch (route) {
      case Routes.splashPage:
        {
          final String? costumeId = arguments as String?;
          return BlocProvider(
            create: (context) {
              final CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
              if (costumeId != null) {
                bloc.add(CostumeFormEvent.loadCostume(costumeId));
              }
              return bloc;
            },
            child: CostumeEditForm(),
          );
        }
      case Routes.signIn:
        {
          final String? costumeId = arguments as String?;
          return BlocProvider(
            create: (context) {
              final CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
              if (costumeId != null) {
                bloc.add(CostumeFormEvent.loadCostume(costumeId));
              }
              return bloc;
            },
            child: CostumeEditForm(),
          );
        }
      case Routes.register:
        {
          final String? costumeId = arguments as String?;
          return BlocProvider(
            create: (context) {
              final CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
              if (costumeId != null) {
                bloc.add(CostumeFormEvent.loadCostume(costumeId));
              }
              return bloc;
            },
            child: CostumeEditForm(),
          );
        }
      case Routes.costumesEdit:
        {
          final String? costumeId = arguments as String?;
          return BlocProvider(
            create: (context) {
              final CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
              if (costumeId != null) {
                bloc.add(CostumeFormEvent.loadCostume(costumeId));
              }
              return bloc;
            },
            child: CostumeEditForm(),
          );
        }
      case Routes.costumeDetails:
        {
          final Costume costume = arguments as Costume;
          return BlocProvider(
              create: (context) =>
              Locator().locator<CostumeDetailsBloc>()
                ..add(CostumeDetailsEvent.initialize(costume)),
              child: CostumeDetailsDisplay(costume: costume));
        }
      case Routes.categorySelection:
        {
          final Costume costume = arguments as Costume;
          return BlocProvider(
              create: (context) =>
              Locator().locator<CostumeDetailsBloc>()
                ..add(CostumeDetailsEvent.initialize(costume)),
              child: CostumeDetailsDisplay(costume: costume));
        }
      case Routes.gallery:
        {
          // ignore: prefer_final_locals
          final Costume costume = arguments as Costume;
          return BlocProvider(
              create: (context) =>
              Locator().locator<CostumeDetailsBloc>()
                ..add(CostumeDetailsEvent.initialize(costume)),
              child: CostumeDetailsDisplay(costume: costume));
        }
      default:
        {
          final Costume costume = arguments as Costume;
          return BlocProvider(
              create: (context) =>
              Locator().locator<CostumeDetailsBloc>()
                ..add(CostumeDetailsEvent.initialize(costume)),
              child: CostumeDetailsDisplay(costume: costume));
        }
    }
  }
}