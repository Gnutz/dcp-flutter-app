part of 'costume_image_watcher_bloc.dart';

@freezed

class CostumeImageWatcherState with _$CostumeImageWatcherState {
  /*const factory CostumeImageWatcherState({
    required List<CostumeImage> images
  }) = _CostumeImageWatcherState;*/

  factory CostumeImageWatcherState.initial() =  Initial;
  factory CostumeImageWatcherState.loading() = Loading;
  factory CostumeImageWatcherState.success(List<CostumeImage> images) = Success;
}
