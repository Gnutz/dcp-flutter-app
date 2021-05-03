import 'package:digtial_costume_platform/application/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/application/costume/details/costume_details_bloc.dart';
import 'package:digtial_costume_platform/application/gallery/search_form/search_form_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/presentation/costume/details/costume_details_display.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/search_form.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/constants.dart';

class CostumeDetailsPage extends StatelessWidget {
  final Costume costume;
  late BuildContext _context;
  late AuthBloc _auth;

  CostumeDetailsPage({required this.costume});

  @override
  Widget build(BuildContext context) {
    _auth = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: MyColorTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColorTheme.appBarBackgroundColor,
        actions: [
          TextButton.icon(
              onPressed: () {
                _auth.add(const AuthEvent.signOut());
              },
              icon: const Icon(
                Icons.person,
                color: MyColorTheme.buttonTextColor,
              ),
              label: const Text(StringsConstants.signOut,
                style: TextStyle(color: MyColorTheme.buttonTextColor),
              )),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchForm(),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => Locator().locator<CostumeDetailsBloc>()
            ..add(CostumeDetailsEvent.initalize(costume)),
          child: CostumeDetailsDisplay(costume: costume),
        ),
      ),
    );
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
