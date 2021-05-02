

import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/presentation/costume/page_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/costume/details/costume_details_bloc.dart';
import '../application/costume/edit/costume_form_bloc.dart';
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
              CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
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
              CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
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
              CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
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
              CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
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
          Costume costume = arguments as Costume;
          return BlocProvider(
              create: (context) =>
              Locator().locator<CostumeDetailsBloc>()
                ..add(CostumeDetailsEvent.initalize(costume)),
              child: CostumeDetailsDisplay(costume: costume));
        }
      case Routes.categorySelection:
        {
          Costume costume = arguments as Costume;
          return BlocProvider(
              create: (context) =>
              Locator().locator<CostumeDetailsBloc>()
                ..add(CostumeDetailsEvent.initalize(costume)),
              child: CostumeDetailsDisplay(costume: costume));
        }
      case Routes.gallery:
        {
          Costume costume = arguments as Costume;
          return BlocProvider(
              create: (context) =>
              Locator().locator<CostumeDetailsBloc>()
                ..add(CostumeDetailsEvent.initalize(costume)),
              child: CostumeDetailsDisplay(costume: costume));
        }
      default:
        {
          Costume costume = arguments as Costume;
          return BlocProvider(
              create: (context) =>
              Locator().locator<CostumeDetailsBloc>()
                ..add(CostumeDetailsEvent.initalize(costume)),
              child: CostumeDetailsDisplay(costume: costume));
        }
    };
  }
}