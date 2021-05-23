part of 'costume_image_watcher_bloc.dart';

@freezed
class CostumeImageWatcherState with _$CostumeImageWatcherState {
  const factory CostumeImageWatcherState({
    required List<CostumeImage> images
  }) = _CostumeImageWatcherState;

  factory CostumeImageWatcherState.initial() =>  const CostumeImageWatcherState(images: []);
  factory CostumeImageWatcherState.loading() => const CostumeImageWatcherState(images: []);
  factory CostumeImageWatcherState.success(List<CostumeImage> images) => CostumeImageWatcherState(images: images);

}

