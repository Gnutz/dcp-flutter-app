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

  const factory CostumeFormEvent.storageLocationSelected(
      StorageLocation location) = StorageLocationSelected;

  const factory CostumeFormEvent.loadFormOptions() = LoadFormOptions;

  const factory CostumeFormEvent.saveChangesPressed() = SaveChangesPressed;

  const factory CostumeFormEvent.saveCostume() = SaveCostume;

  const factory CostumeFormEvent.themeValueChanged(
      String theme) = ThemeValueChanged;

  const factory CostumeFormEvent.themeAdded() = ThemeAdded;

  const factory CostumeFormEvent.themeRemoved(String theme) = ThemeRemoved;

  const factory CostumeFormEvent.colorValueChanged(
      String color) = ColorValueChanged;

  const factory CostumeFormEvent.colorAdded() = ColorAdded;

  const factory CostumeFormEvent.colorRemoved(String color) = ColorRemoved;

  const factory CostumeFormEvent.mainLocationSelected(Location main)
  = MainLocationSelected;

  const factory CostumeFormEvent.subLocationSelected(Location location) =
  SubLocationSelected;


}
