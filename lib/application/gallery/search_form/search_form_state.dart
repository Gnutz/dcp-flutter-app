part of 'search_form_bloc.dart';

@freezed
class SearchFormState with _$SearchFormState {
  const factory SearchFormState({
    required List<String> productionOptions,
    required List<String> categoryOptions,
    required List<String> timePeriodOptions,
    required String currentColor,
    required String currentTheme,
    String? productionTitle,
    Fashion? fashion,
    String? category,
    String? timePeriod,
    List<String>? themes,
    List<String>? colors,
  }) = _SearchFormState;

  factory SearchFormState.initial() => const SearchFormState(
      productionOptions: <String>[],
      categoryOptions: <String>[],
      timePeriodOptions: <String>[],
      currentColor: "",
      currentTheme: "",
      themes: <String>[],
      colors: <String>[]);
}
