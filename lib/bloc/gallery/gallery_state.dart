part of 'gallery_bloc.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState({
    required List<Costume> costumes,
    Costume? selected}) = _GalleryState;

  factory GalleryState.initial() => const GalleryState(costumes: <Costume>[]);
}
