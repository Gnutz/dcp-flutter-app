import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'costume_form_bloc.freezed.dart';

part 'costume_form_event.dart';

part 'costume_form_state.dart';

class CostumeFormBloc extends Bloc<CostumeFormEvent, CostumeFormState> {
  final ICostumeRepository _costumeRepository;

  CostumeFormBloc(this._costumeRepository) : super(CostumeFormState.initial());

  @override
  Stream<CostumeFormState> mapEventToState(
    CostumeFormEvent event,
  ) async* {
    yield* event.map(categorySelected: (e) async* {
      yield _categorySelectedEventHandler(e);
    }, timePeriodSelected: (e) async* {
      yield _timePeriodSelectedHandler(e);
    }, fashionSelected: (e) async* {
      yield _fashionSelectedHandler(e);
    }, quantityChanged: (e) async* {
      yield _quantityChangedHandler(e);
    }, colorAdded: (e) async* {
      yield _colorAddedEventHandler(e);
    }, storageLocationSelected: (e) async* {
      yield _storageLocationSelectedEventHandler(e);
    }, loadFormOptions: (_) async* {
      yield _loadFormOptionsEventHandler();
    }, saveChangesPressed: (_) async* {
      _saveChangesPressedEventHandler();
    }, saveCostume: (_) async* {
      _saveCostumeEventHandler();
    });
  }

  CostumeFormState _categorySelectedEventHandler(CategorySelected e) {
    return state.copyWith(category: e.category);
  }

  CostumeFormState _timePeriodSelectedHandler(TimePeriodSelected e) {
    return state.copyWith(timePeriod: e.time);
  }

  CostumeFormState _fashionSelectedHandler(FashionSelected e) {
    return state.copyWith(fashion: e.fashion);
  }

  CostumeFormState _quantityChangedHandler(QuantityChanged e) {
    return state.copyWith(quantity: e.quantity);
  }

  CostumeFormState _colorAddedEventHandler(ColorAdded e) {
    state.colors!.add(e.addedColor);
    return state;
  }

  CostumeFormState _storageLocationSelectedEventHandler(
      StorageLocationSelected e) {
    return state.copyWith(storageLocation: e.location);
  }

  Future<CostumeFormState> _loadFormOptionsEventHandler() async {
    final categoryOptions = await _costumeRepository.getCategories();
    final timePeriodOptions = await _costumeRepository.getTimePeriods();
    final storageOptions = await _costumeRepository.getStorageLocations();

    return state.copyWith(
        loading: false,
        categoryOptions: categoryOptions,
        timePeriodOptions: timePeriodOptions,
        storageLocationOptions: storageOptions);
  }

  void _saveChangesPressedEventHandler() {}

  void _saveCostumeEventHandler() {}
}
