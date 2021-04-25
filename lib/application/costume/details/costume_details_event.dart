part of 'costume_details_bloc.dart';

@freezed
abstract class CostumeDetailsEvent with _$CostumeDetailsEvent {
  const factory CostumeDetailsEvent.deleteCostume() = DeleteCostume;

  const factory CostumeDetailsEvent.editCostumePressed() = EditCostumePressed;

  const factory CostumeDetailsEvent.checkOutCostume(
      Production production) = CheckOutCostume;

  const factory CostumeDetailsEvent.addCostumeToList(
      CostumeList list) = AddCostumeToList;

  const factory CostumeDetailsEvent.checkOutToNewProductionPressed() = CheckOutToNewProductionPressed;

  const factory CostumeDetailsEvent.initalize(Costume costume) = Initalize;
}

