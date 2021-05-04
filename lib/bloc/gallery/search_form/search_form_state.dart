part of 'search_form_bloc.dart';

@freezed
class SearchFormState with _$SearchFormState {
  const factory SearchFormState({
    required List<String> colorOptions,
    required List<String> themeOptions,
    required List<Production> productionOptions,
    required List<String> categoryOptions,
    required List<String> timePeriodOptions,
    required String currentColor,
    required String currentTheme,
    Production? production,
    Fashion? fashion,
    String? category,
    String? timePeriod,
    List<String>? themes,
    List<String>? colors,
  }) = _SearchFormState;

  factory SearchFormState.initial() => const SearchFormState(
      themeOptions: <String>[],
      colorOptions: <String>[],
      productionOptions: <Production>[],
      categoryOptions: <String>[],
      timePeriodOptions: <String>[],
      currentColor: StringsConstants.empty,
      currentTheme: StringsConstants.empty,
      themes: <String>[],
      colors: <String>[]);
}
