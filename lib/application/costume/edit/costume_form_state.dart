part of 'costume_form_bloc.dart';

@freezed
class CostumeFormState with _$CostumeFormState {
  const factory CostumeFormState(
      {required bool loading,
      required List<String> timePeriodOptions,
      required List<String> categoryOptions,
      required List<Location> storageMainLocationOptions,
      required List<Location> storageSubLocationOptions,
      required String currentColor,
      required String currentTheme,
      required bool unSavedChanges,
      String? id,
      Fashion? fashion,
      String? category,
      String? timePeriod,
      List<String>? themes,
      List<String>? colors,
      List<Production>? productions,
      int? quantity,
      Location? mainLocation,
      Location? subLocation}) = _CostumeFormState;

  factory CostumeFormState.initial() => const CostumeFormState(
      loading: true,
      unSavedChanges: false,
      currentColor: "",
      currentTheme: "",
      categoryOptions: <String>[],
      timePeriodOptions: <String>[],
      storageMainLocationOptions: <Location>[],
      storageSubLocationOptions: <Location>[],
      themes: <String>[],
      colors: <String>[]);
}
