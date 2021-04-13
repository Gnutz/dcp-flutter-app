part of 'category_selection_bloc.dart';

@freezed
class CategorySelectionState with _$CategorySelectionState {
  const factory CategorySelectionState(
      {required bool loading,
      required List<CostumeCategory> categories}) = _CategorySelectionState;

  factory CategorySelectionState.initial() => const CategorySelectionState(
    loading: true,
        categories: <CostumeCategory>[],
      );
}