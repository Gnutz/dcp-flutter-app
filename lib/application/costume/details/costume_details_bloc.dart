import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:meta/meta.dart';

part 'costume_details_event.dart';

part 'costume_details_state.dart';

class CostumeDetailsBloc
    extends Bloc<CostumeDetailsEvent, CostumeDetailsState> {
  final IGalleryService _galleryService;

  CostumeDetailsBloc(this._galleryService) : super(CostumeDetailsInitial());

  @override
  Stream<CostumeDetailsState> mapEventToState(
    CostumeDetailsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
