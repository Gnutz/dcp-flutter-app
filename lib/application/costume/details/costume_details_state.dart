part of 'costume_details_bloc.dart';

@freezed
class CostumeDetailsState with _$CostumeDetailsState {
  const factory CostumeDetailsState({Costume? costume}) = _CostumeDetailState;

  factory CostumeDetailsState.inital() => const CostumeDetailsState();
}
