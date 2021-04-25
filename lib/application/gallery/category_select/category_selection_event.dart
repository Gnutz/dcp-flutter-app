part of 'category_selection_bloc.dart';

@freezed
class CategorySelectionEvent with _$CategorySelectionEvent {
  const factory CategorySelectionEvent.categorySelected(
      String selectedCategory) = CategorySelected;

  const factory CategorySelectionEvent.loadCategories() = LoadCategories;
}
