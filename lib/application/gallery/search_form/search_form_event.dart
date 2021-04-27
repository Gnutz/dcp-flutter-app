part of 'search_form_bloc.dart';

@freezed
class SearchFormEvent with _$SearchFormEvent {
  const factory SearchFormEvent.loadFormOptions() = LoadFormOptions;

  const factory SearchFormEvent.categorySelected(String category) =
      CategorySelected;

  const factory SearchFormEvent.timePeriodSelected(String time) =
      TimePeriodSelected;

  const factory SearchFormEvent.fashionSelected(Fashion fashion) =
      FashionSelected;

  const factory SearchFormEvent.productionSelected(String productionTitle) =
      ProductionSelected;

  const factory SearchFormEvent.searchPressed() = SearchPressed;

  const factory SearchFormEvent.themeValueChanged(String theme) =
      ThemeValueChanged;

  const factory SearchFormEvent.themeAdded() = ThemeAdded;

  const factory SearchFormEvent.themeRemoved(String theme) = ThemeRemoved;

  const factory SearchFormEvent.colorValueChanged(String color) =
      ColorValueChanged;

  const factory SearchFormEvent.colorAdded() = ColorAdded;

  const factory SearchFormEvent.colorRemoved(String color) = ColorRemoved;
}
