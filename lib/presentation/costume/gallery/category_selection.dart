import 'package:digtial_costume_platform/application/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/application/gallery/category_select/category_selection_bloc.dart';
import 'package:digtial_costume_platform/application/gallery/search_form/search_form_bloc.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/category_grid.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/search_form.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectionPage extends StatelessWidget {
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    AuthBloc _auth = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: MyColorTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColorTheme.appBarBackgroundColor,
          actions: [
            TextButton.icon(
                onPressed: () {
                  _auth.add(AuthEvent.signOut());
                },
                icon: const Icon(
                  Icons.person,
                  color: MyColorTheme.buttonTextColor,
                ),
                label: Text(
                  "Sign Out",
                style: const TextStyle(color: MyColorTheme.buttonTextColor),
              )),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchForm(),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => Locator().locator<CategorySelectionBloc>(),
          child: CategoryGrid(),
        ),
      ),
        floatingActionButton: _auth.state.user!.isCreator
            ? FloatingActionButton(
                backgroundColor: MyColorTheme.buttonColor,
                onPressed: () {
                  NavigationService.instance!.pushNamed(Routes.costumesEdit);
                },
                child: const Icon(Icons.add),
              )
            : null);
  }

  void _showSearchForm() {
    showModalBottomSheet(
        context: _context,
        builder: (context) {
          return Container(
              child: BlocProvider(
                create: (context) => Locator().locator<SearchFormBloc>(),
                child: SearchForm(),
              ));
        });
  }
}
