import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'category_selection_bloc.freezed.dart';
part 'category_selection_event.dart';
part 'category_selection_state.dart';

class CategorySelectionBloc
    extends Bloc<CategorySelectionEvent, CategorySelectionState> {
  final IGalleryService _galleryService;

  CategorySelectionBloc(this._galleryService)
      : super(CategorySelectionState.initial()) {
    add(const CategorySelectionEvent.loadCategories());
  }

  @override
  Stream<CategorySelectionState> mapEventToState(
    CategorySelectionEvent event,
  ) async* {
    yield* event.map(categorySelected: (e) async* {
      _categorySelectedEventHandler(e);
    }, loadCategories: (_) async* {
      yield* _loadCategories();
    });
  }

  void _categorySelectedEventHandler(CatagorySelected e) {
    print(e.selected.category);
    NavigationService.instance!
        .pushNamed(
        Routes.gallery, arguments: CostumeQuery(category: e.selected.category));
  }

  Stream<CategorySelectionState> _loadCategories() async* {
    yield CategorySelectionState.initial();

    final categories = _galleryService.categories;
    yield state.copyWith(loading: false, categories: categories);
  }
}

