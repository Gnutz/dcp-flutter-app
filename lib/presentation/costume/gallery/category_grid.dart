import 'package:digtial_costume_platform/application/gallery/category_select/category_selection_bloc.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:digtial_costume_platform/shared/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryGrid extends StatelessWidget {
  late final CategorySelectionBloc _selectionBloc;
  late final BuildContext _context;
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
                .map((String category) => InkWell(
                      //TODO change
                      onTap: () =>
                          _selectionBloc.add(CategorySelected(category)),
                      child: CategoryCard(costumeCategory: category),
                    ))
                .toList(),
          ]),
    );
  }

  void selectCategory(String category) {
    _selectionBloc.add(CategorySelectionEvent.categorySelected(category));
  }
}

class CategoryCard extends StatelessWidget {
  final String costumeCategory;

  const CategoryCard({Key? key, required this.costumeCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColorTheme.inputDecoratorFocusedBorderOutlineSideColor,
      child: Center(
        child: Column(
          children: [
            Expanded(
                child: Image.asset(
                    "images/icons/costume_categories/$costumeCategory.png")),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(costumeCategory..capitalize(),
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: MyColorTheme.buttonTextColor)),
            ),
          ],
        ),
      ),
    );
  }
}
