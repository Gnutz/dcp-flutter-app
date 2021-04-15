part of 'costume_form_bloc.dart';

@freezed
class CostumeFormEvent with _$CostumeFormEvent {
  const factory CostumeFormEvent.categorySelected(CostumeCategory category) =
      CategorySelected;

  const factory CostumeFormEvent.timePeriodSelected(String time) =
      TimePeriodSelected;

  const factory CostumeFormEvent.fashionSelected(Fashion fashion) =
      FashionSelected;

  const factory CostumeFormEvent.quantityChanged(int quantity) =
      QuantityChanged;

  const factory CostumeFormEvent.colorAdded(String addedColor) = ColorAdded;

  const factory CostumeFormEvent.storageLocationSelected(
      StorageLocation location) = StorageLocationSelected;

  const factory CostumeFormEvent.loadFormOptions() = LoadFormOptions;

  const factory CostumeFormEvent.saveChangesPressed() = SaveChangesPressed;

  const factory CostumeFormEvent.saveCostume() = SaveCostume;
}
