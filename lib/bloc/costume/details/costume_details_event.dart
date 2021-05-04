part of 'costume_details_bloc.dart';

@freezed
class CostumeDetailsEvent with _$CostumeDetailsEvent {
  const factory CostumeDetailsEvent.loadProductionOptions() = LoadProductionOptions;

  const factory CostumeDetailsEvent.deleteCostume() = DeleteCostume;

  const factory CostumeDetailsEvent.editCostumePressed() = EditCostumePressed;

  const factory CostumeDetailsEvent.checkOutCostume(
      Production production) = CheckOutCostume;

  const factory CostumeDetailsEvent.addCostumeToList(
      CostumeList list) = AddCostumeToList;

  const factory CostumeDetailsEvent.checkOutToNewProductionPressed() = CheckOutToNewProductionPressed;

  const factory CostumeDetailsEvent.initialize(Costume costume) = Initialize;
}

