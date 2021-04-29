import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_list.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costume_details_bloc.freezed.dart';
part 'costume_details_event.dart';
part 'costume_details_state.dart';

class CostumeDetailsBloc
    extends Bloc<CostumeDetailsEvent, CostumeDetailsState> {
  final IGalleryService _galleryService;

  CostumeDetailsBloc(this._galleryService)
      : super(CostumeDetailsState.inital());

  @override
  Stream<CostumeDetailsState> mapEventToState(
      CostumeDetailsEvent event) async* {
    yield* event.map(
      checkOutToNewProductionPressed:
          (CheckOutToNewProductionPressed e) async* {},
      addCostumeToList: (AddCostumeToList e) async* {},
      editCostumePressed: (EditCostumePressed e) async* {},
      deleteCostume: (_) async* {
        deleteCostumeEventHandler();
      },
      checkOutCostume: (CheckOutCostume e) async* {
        yield* _checkOutCostumeEventHandler(e);
      },
      initalize: (Initalize e) async* {
        yield state.copyWith(costume: e.costume);
      },
    );
  }

  Stream<CostumeDetailsState> _checkOutCostumeEventHandler(
      CheckOutCostume e) async* {
    final result = await _galleryService.checkOut(state.costume!, e.production);
    if (result != null) {
      yield state.copyWith(costume: result);
    }
  }

  void deleteCostumeEventHandler() {
    _galleryService.deleteCostume(state.costume!.id!);
    ScaffoldMessenger.of(NavigationService.currentContext!)
        .showSnackBar(const SnackBar(content: Text("The costume was deleted")));
  }
}