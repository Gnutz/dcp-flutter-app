import 'package:digtial_costume_platform/application/costume/details/costume_details_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/costume/details/costume_details_display.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CostumeDetailsPage extends StatelessWidget {
  final Costume costume;

  const CostumeDetailsPage({required this.costume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorTheme.backgroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => Locator().locator<CostumeDetailsBloc>()
            ..add(CostumeDetailsEvent.initalize(costume)),
          child: CostumeDetailsDisplay(costume: costume),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
    );
  }
}
