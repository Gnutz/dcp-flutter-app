part of 'gallery_bloc.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.performQuery(CostumeQuery query) = PerformQuery;

  const factory GalleryEvent.selectCostumeForDisplay(Costume selected) =
      SelectCostumeForDisplay;
}
