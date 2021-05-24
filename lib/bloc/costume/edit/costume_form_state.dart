part of 'costume_form_bloc.dart';

@freezed
class CostumeFormState with _$CostumeFormState {
  const factory CostumeFormState(
      {required List<String> timePeriodOptions,
      required List<String> categoryOptions,
      required List<Location> storageMainLocationOptions,
      required List<Location> storageSubLocationOptions,
      required String currentColor,
      required String currentTheme,
      required bool unSavedChanges,
      required List<CostumeImage> images,
      String? id,
      Fashion? fashion,
      String? category,
      DateTime? created,
      String? timePeriod,
      List<String>? themes,
      List<String>? colors,
      List<Production>? productions,
      int? quantity,
      Location? mainLocation,
      Location? subLocation}) = _CostumeFormState;

  factory CostumeFormState.initial() => const CostumeFormState(
      unSavedChanges: false,
      currentColor: StringsConstants.empty,
      currentTheme: StringsConstants.empty,
      fashion: Fashion.mens,
      quantity: 1,
      categoryOptions: <String>[],
      timePeriodOptions: <String>[],
      storageMainLocationOptions: <Location>[],
      storageSubLocationOptions: <Location>[],
      themes: <String>[],
      colors: <String>[],
      images: <CostumeImage>[]);
}