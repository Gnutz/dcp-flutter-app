import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/data/services/i_gallery_service.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costume_image_watcher_bloc.freezed.dart';
part 'costume_image_watcher_event.dart';
part 'costume_image_watcher_state.dart';

class CostumeImageWatcherBloc extends Bloc<CostumeImageWatcherEvent, CostumeImageWatcherState> {
  CostumeImageWatcherBloc(this._galleryService)
      : super(CostumeImageWatcherState.initial());

  final IGalleryService _galleryService;

  StreamSubscription<List<CostumeImage>>? _imageStream;

  @override
  Stream<CostumeImageWatcherState> mapEventToState(
      CostumeImageWatcherEvent event,) async* {
    yield* event.map(receivedImages: (ReceivedImages event) async* {
      yield CostumeImageWatcherState.success(event.images);
    }, startListeningForImages: (StartListeningForImages event) async* {
      _imageStream?.cancel();
      _imageStream = _galleryService.watchCostumesImages(event.costumeId)
          .listen((images) => add(CostumeImageWatcherEvent.receivedImages(images)));
    });
  }

  @override
  Future<void> close() async{
    await _imageStream?.cancel();
    super.close();
  }
}
