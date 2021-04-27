import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'category_selection_bloc.freezed.dart';

part 'category_selection_event.dart';

part 'category_selection_state.dart';

///A Bloc handling events on the [CategorySelectionPage] by mapping [CategorySelectionEvent]
///to [CategorySelectionState] by extending [Bloc]
class CategorySelectionBloc
    extends Bloc<CategorySelectionEvent, CategorySelectionState> {
  final IGalleryService _galleryService;

  CategorySelectionBloc(this._galleryService)
      : super(CategorySelectionState.initial()) {
    add(const CategorySelectionEvent.loadCategories());
  }

  ///Maps events to state through event handler methods
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

  ///Navigates to [GalleryPage] with a [CostumeQuery] based on the selected category
  void _categorySelectedEventHandler(CategorySelected e) async {
    // NavigationService.instance!
    //   .pushNamed(
    //   Routes.gallery, arguments: CostumeQuery(category: e.selectedCategory));

    NavigationService.instance!.pushNamed(Routes.costumeDetails,
        arguments: await _galleryService.getCostume("Sinj5ma1ofeSaZ392YC3"));
  }

  ///pushes a [CategorySelectionState] into the stream with the available categories
  Stream<CategorySelectionState> _loadCategories() async* {
    yield CategorySelectionState.initial();

    final categories = await _galleryService.getCategories();
    yield state.copyWith(loading: false, categories: categories);
  }
}

