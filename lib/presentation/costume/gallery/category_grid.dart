import 'package:digtial_costume_platform/bloc/gallery/category_select/category_selection_bloc.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/data/services/i_gallery_service.dart';
import 'package:digtial_costume_platform/presentation/costume/gallery/category_card.dart';
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
    return BlocConsumer<CategorySelectionBloc, CategorySelectionState>(
      listener: (context, state) {},
      builder: (context, state) => _buildCategoryGrid(context, state),
    );
  }

  Widget _buildCategoryGrid(BuildContext context, CategorySelectionState state) {
    return Container(
      //buttom insets work for navbar with floating action button
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: GridView.count(
          crossAxisCount: 2,
          semanticChildCount: state.categories.length,
          children: [
            ...state.categories
                .map((String category) => InkWell(
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

