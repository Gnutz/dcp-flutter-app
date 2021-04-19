/*
class categoryGrid extends StatefulWidget {
  @override
  _categoryGridState createState() => _categoryGridState();
}

class _categoryGridState extends State<categoryGrid> {
  List<CostumeCategory> _categories;
  bool _loading;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategorySelectionBloc, CategorySelectionState>(listener: (context, state){
      if(state.loading == true){

      }
  }
} */

import 'package:digtial_costume_platform/application/gallery/category_select/category_selection_bloc.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:digtial_costume_platform/shared/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryGrid extends StatelessWidget {
  late final CategorySelectionBloc _selectionBloc;
  late BuildContext _context;
  final IGalleryService galleryService = Locator().locator<IGalleryService>();

  @override
  Widget build(BuildContext context) {
    _context = context;
    _selectionBloc = _context.read<CategorySelectionBloc>();
    //TODO: do I only need listener, builder?
    return BlocConsumer<CategorySelectionBloc, CategorySelectionState>(
      listener: (context, state) {},
      builder: (context, state) => _buildCategoryGrid(context, state),
    );
  }

  Widget _buildCategoryGrid(BuildContext context, CategorySelectionState state) {
    return Container(
      //buttom insets work for navbar with floating action button
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 42),
      child: GridView.count(
          crossAxisCount: 2,
          semanticChildCount: state.categories.length,
          children: [
            ...state.categories
                .map<Widget>((category) => InkWell(
                      //TODO change
                      onTap: () async => NavigationService.instance!.pushNamed(
                          Routes.costumeDetails,
                          arguments: await galleryService
                              .getCostume("fsFaDiWglT0dqYNwhtV6")),
                      child: CategoryCard(costumeCategory: category),
                    ))
                .toList(),
          ]),
    );
  }

  void selectCategory(CostumeCategory category) {
    _selectionBloc.add(CategorySelectionEvent.categorySelected(category));
  }
}

class CategoryCard extends StatelessWidget {
  final CostumeCategory costumeCategory;

  const CategoryCard({Key? key, required this.costumeCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          children: [
            Expanded(
                child: Image.asset(
                    "images/icons/costume_categories/${costumeCategory.category}.png")),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(costumeCategory.category.capitalize(),
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
            ),
          ],
        ),
      ),
    );
  }
}
