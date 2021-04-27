import 'package:digtial_costume_platform/application/gallery/gallery_bloc.dart';
import 'package:digtial_costume_platform/application/gallery/search_form/search_form_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/gallery.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/search_form.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryPage extends StatelessWidget {
  final CostumeQuery query;

  late BuildContext _context;

  GalleryPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColorTheme.backgroundColor,
      /*appBar:
          AppBar(backgroundColor: Colors.brown[400], elevation: 0.0, actions: [
        IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ]), */
      body: SafeArea(
        child: BlocProvider(
          create: (context) => Locator().locator<GalleryBloc>()
            ..add(GalleryEvent.performQuery(query)),
          child: Gallery(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Container(
          decoration:
              BoxDecoration(color: MyColorTheme.inputDecoratorFillColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => _showSearchForm(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColorTheme.buttonColor,
        onPressed: () {
          NavigationService.instance!.pushNamed(Routes.costumesEdit);
        },
        child: const Icon(Icons.add),
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
