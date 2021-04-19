import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costume_form_bloc.freezed.dart';
part 'costume_form_event.dart';
part 'costume_form_state.dart';

class CostumeFormBloc extends Bloc<CostumeFormEvent, CostumeFormState> {
  final ICostumeRepository _costumeRepository;
  final IGalleryService _costumeService;

  CostumeFormBloc(this._costumeRepository, this._costumeService)
      : super(CostumeFormState.initial()) {
    add(const CostumeFormEvent.loadFormOptions());
  }

  @override
  Stream<CostumeFormState> mapEventToState(
    CostumeFormEvent event,
  ) async* {
    yield* event.map(
      categorySelected: (e) async* {
        yield _categorySelectedEventHandler(e);
      },
      timePeriodSelected: (e) async* {
        yield _timePeriodSelectedHandler(e);
      },
      fashionSelected: (e) async* {
        yield _fashionSelectedHandler(e);
      },
      quantityChanged: (e) async* {
        yield _quantityChangedHandler(e);
      },
      colorAdded: (_) async* {
        yield _colorAddedEventHandler();
      },
      loadFormOptions: (_) async* {
        yield* _loadFormOptionsEventHandler();
      },
      saveChangesPressed: (_) async* {
        _saveChangesPressedEventHandler();
      },
      saveCostume: (_) async* {
        _saveCostumeEventHandler();
      },
      themeValueChanged: (ThemeValueChanged e) async* {
        yield _themeValueEventHandler(e);
      },
      themeAdded: (ThemeAdded e) async* {
        yield _themeAdded();
      },
      colorRemoved: (ColorRemoved e) async* {
        yield colorRemovedEventHandler(e);
      },
      themeRemoved: (ThemeRemoved e) async* {
        yield themeRemovedEventHandler(e);
      },
      colorValueChanged: (ColorValueChanged e) async* {
        yield colorValueChangedEventHandler(e);
      },
      mainLocationSelected: (MainLocationSelected e) async* {
        yield* mainLocationSelectedEventHandler(e);
      },
      subLocationSelected: (SubLocationSelected e) async* {
        yield subLocationSelectedEventHandler(e);
      },
    );
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

  CostumeFormState _colorAddedEventHandler() {
    final colors = state.colors!.toList();
    colors.add(state.currentColor);

    return state.copyWith(colors: colors, currentColor: "");
  }

  Stream<CostumeFormState> _loadFormOptionsEventHandler() async* {
    final categoryOptions = await _costumeRepository.getCategories();
    final timePeriodOptions = await _costumeRepository.getTimePeriods();
    final storageOptions = await _costumeRepository.getStorageMainLocations();

    yield state.copyWith(
        loading: false,
        categoryOptions: categoryOptions,
        timePeriodOptions: timePeriodOptions,
        storageMainLocationOptions: storageOptions);
  }

  void _saveChangesPressedEventHandler() {}

  void _saveCostumeEventHandler() async {
    Costume? result;

    if (state.id != null) {
      result = await _costumeService.getCostume(state.id!);
    }

    final Costume costume = result ?? Costume();

    costume.edited = DateTime.now();
    costume.category = state.category!.category;
    costume.timePeriod = state.timePeriod;
    costume.fashion = state.fashion;
    costume.themes = state.themes;
    costume.colors = state.colors;
    costume.quantity = state.quantity;
    costume.storageLocation = StorageLocation(
        main: state.mainLocation!, subLocation: state.subLocation!);

    if (costume.storageLocation!.subLocation != null ||
        costume.storageLocation!.main != null) {
      costume.status = InStorage(costume.storageLocation!);
    }

    if (state.id != null) {
      _costumeService.updateCostume(costume);
    } else {
      _costumeService.createCostume(costume);
    }
  }

  CostumeFormState _themeValueEventHandler(ThemeValueChanged e) {
    return state.copyWith(currentTheme: e.theme);
  }

  CostumeFormState _themeAdded() {
    print(state.currentTheme);
    if (state.currentTheme.isNotEmpty) {
      //TODO: fix
      final themes = state.themes!.toList();
      themes.add(state.currentTheme);

      for (final theme in state.themes!) {
        print(theme);
      }

      return state.copyWith(themes: themes, currentTheme: "");
    }

    return state;
  }

  CostumeFormState colorRemovedEventHandler(ColorRemoved e) {
    final colors = state.colors!.toList();
    colors.remove(e.color);
    return state.copyWith(colors: colors);
  }

  CostumeFormState themeRemovedEventHandler(ThemeRemoved e) {
    var themes = state.themes!.toList();
    themes.remove(e.theme);
    return state.copyWith(themes: themes);
  }

  CostumeFormState colorValueChangedEventHandler(ColorValueChanged e) {
    return state.copyWith(currentColor: e.color);
  }

  Stream<CostumeFormState> mainLocationSelectedEventHandler(
      MainLocationSelected e) async* {
    final mainLocation = e.main;

    yield state.copyWith(mainLocation: mainLocation);

    final subLocationsOptions =
        await _costumeRepository.getStorageSubLocations(mainLocation.id!);

    if (subLocationsOptions != null) {
      yield state.copyWith(storageSubLocationOptions: subLocationsOptions);
    }
  }

  CostumeFormState subLocationSelectedEventHandler(SubLocationSelected e) {
    return state.copyWith(subLocation: e.location);
  }
}
