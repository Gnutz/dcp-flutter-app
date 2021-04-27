part of 'gallery_bloc.dart';

@freezed
abstract class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.perforQuery(CostumeQuery query) = PerformQuery;
}
