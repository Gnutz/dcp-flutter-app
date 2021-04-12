import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'search_bloc.freezed.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IGalleryService _galleryService;

  SearchBloc(this._galleryService) : super(SearchState.initial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
