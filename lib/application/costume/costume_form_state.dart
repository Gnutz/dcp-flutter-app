part of 'costume_form_bloc.dart';

@freezed
class CostumeFormState with _$CostumeFormState {
  const factory CostumeFormState(
      {required bool loading,
      required List<String> timePeriodOptions,
      required List<String> categoryOptions,
      required List<StorageLocation> storageLocationOptions,
      String? id,
      Fashion? fashion,
      CostumeCategory? category,
      String? timePeriod,
      List<String>? themes,
      List<String>? colors,
      List<Production>? productions,
      int? quantity,
      StorageLocation? storageLocation}) = _CostumeFormState;

  factory CostumeFormState.initial() => const CostumeFormState(
      loading: true,
      categoryOptions: <String>[],
      timePeriodOptions: <String>[],
      storageLocationOptions: <StorageLocation>[]);
}
