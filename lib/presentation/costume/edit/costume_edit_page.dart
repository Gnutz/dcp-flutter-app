import 'package:digtial_costume_platform/application/costume/edit/costume_form_bloc.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'costume_edit_form.dart';

class CostumeEditPage extends StatelessWidget {
  final String? costumeId;

  const CostumeEditPage({this.costumeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorTheme.backgroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            CostumeFormBloc bloc = Locator().locator<CostumeFormBloc>();
            if (costumeId != null) {
              bloc.add(CostumeFormEvent.loadCostume(costumeId));
            }
            return bloc;
          },
          child: CostumeEditForm(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationService.instance!.pushNamed(Routes.costumesEdit);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
