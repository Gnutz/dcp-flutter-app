part of 'costume_details_bloc.dart';

@freezed
class CostumeDetailsState with _$CostumeDetailsState {
  const factory CostumeDetailsState({
    Costume? costume,
    required List<Production> productionOptions
  }) = _CostumeDetailState;

  factory CostumeDetailsState.inital() => const CostumeDetailsState(
    productionOptions: <Production>[]
  );
}
