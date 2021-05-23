part of 'costume_image_watcher_bloc.dart';

@freezed
abstract class CostumeImageWatcherEvent with _$CostumeImageWatcherEvent {
  const factory CostumeImageWatcherEvent.startListeningForImages(String costumeId) =
  StartListeningForImages;

  const factory CostumeImageWatcherEvent.receivedImages(List<CostumeImage> images) = ReceivedImages;
  const factory CostumeImageWatcherEvent.addImage(String imagePath) = AddImage;
  const factory CostumeImageWatcherEvent.deleteImage(CostumeImage image) = DeleteImage;
}
