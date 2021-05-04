import 'package:digtial_costume_platform/bloc/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/bloc/costume/edit/costume_form_bloc.dart';
import 'package:digtial_costume_platform/bloc/gallery/search_form/search_form_bloc.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/search_form.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'costume_edit_form.dart';

class CostumeEditPage extends StatelessWidget {
  final String? costumeId;
  late BuildContext _context;
  late BlocProvider provider;
  late Widget childWidget;

  CostumeEditPage({this.costumeId});

  @override
  Widget build(BuildContext context) {
    _context = context;
    final AuthBloc _auth = context.read<AuthBloc>();
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
              label: const Text(
                StringsConstants.signOut,
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
          create: (context) {
            final CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
            if (costumeId != null) {
              bloc.add(CostumeFormEvent.loadCostume(costumeId));
            }
            return bloc;
          },
          child: CostumeEditForm(),
        ),
      ),
    );
  }

  void _showSearchForm() {
    showModalBottomSheet(
        context: _context,
        builder: (context) {
          return BlocProvider(
            create: (context) => Locator().locator<SearchFormBloc>(),
            child: SearchForm(),
          );
        });
  }
}
