import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_bloc.freezed.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final IGalleryService _costumeService;

  GalleryBloc(this._costumeService) : super(GalleryState.initial());

  @override
  Stream<GalleryState> mapEventToState(
    GalleryEvent event,
  ) async* {
    yield* event.map(performQuery: (e) async* {
      yield _performQueryEventHandler(e);
    });
  }

  Future<GalleryState> _performQueryEventHandler(PerformQuery e) async {
    final costumes = await _costumeService.getCostumes(e.query);
    return state.copyWith(costumes: costumes);
  }
}
