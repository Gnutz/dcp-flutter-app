part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    Production? production,
    Fashion? fashion,
    String? category,
    String? timePeriod,
    List<String>? themes,
    List<String>? colors,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState();
}
