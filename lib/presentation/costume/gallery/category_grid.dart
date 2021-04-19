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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: do I only need listener, builder?
    return BlocConsumer<CategorySelectionBloc, CategorySelectionState>(
      listener: (context, state) {},
      builder: (context, state) => _buildCategoryGrid(context, state),
    );
  }

  Widget _buildCategoryGrid(
      BuildContext context, CategorySelectionState state) {
    return Container(
      //buttom insets work for navbar with floating action button
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 42),
      child: GridView.count(
          crossAxisCount: 2,
          semanticChildCount: state.categories.length,
          children: [
            ...state.categories
                .map<Widget>((category) => InkWell(
                      onTap: () => context.read<CategorySelectionBloc>().add(
                          CategorySelectionEvent.categorySelected(category)),
                      child: CategoryCard(costumeCategory: category),
                ))
                .toList(),
          ]),
    );
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
                child: Icon(
              costumeCategory.iconUri,
              size: 100,
            )),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(costumeCategory.category,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
            ),
          ],
        ),
      ),
    );
  }
}
