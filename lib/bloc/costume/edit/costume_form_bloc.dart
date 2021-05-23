import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/bloc/costume_image_watcher_bloc.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/fashion.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/data/services/i_gallery_service.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costume_form_bloc.freezed.dart';
part 'costume_form_event.dart';
part 'costume_form_state.dart';

class CostumeFormBloc extends Bloc<CostumeFormEvent, CostumeFormState> {
  final IGalleryService _costumeService;
  late CostumeImageWatcherBloc imageWatcher;

  CostumeFormBloc(this._costumeService)
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
        yield* _saveCostumeEventHandler();
      },
      themeValueChanged: (ThemeValueChanged e) async* {
        yield _themeValueEventHandler(e);
      },
      themeAdded: (ThemeAdded e) async* {
        yield _addTheme();
      },
      colorRemoved: (ColorRemoved e) async* {
        yield colorRemovedEventHandler(e);
      },
      themeRemoved: (ThemeRemoved e) async* {
        yield themeRemovedEventHandler(e);
      },
      colorValueChanged: (ColorValueChanged e) async* {
        yield colorValueChangedEventHandler(e);
      }, mainLocationSelected: (MainLocationSelected e) async* {
      yield* mainLocationSelectedEventHandler(e);
    }, subLocationSelected: (SubLocationSelected e) async* {
      yield subLocationSelectedEventHandler(e);
    }, loadCostume: (LoadCostume e) async* {
      yield* _loadCostumeEventHandler(e);
    }, addImage: (AddImage e) async* {
      yield* _addImageHandler(e);
    }, deleteImage: (DeleteImage e) async* {
      yield* _deleteImageEventHandler(e);
    });
  }

  CostumeFormState _categorySelectedEventHandler(CategorySelected e) {
    return state.copyWith(category: e.category, unSavedChanges: true);
  }

  CostumeFormState _timePeriodSelectedHandler(TimePeriodSelected e) {
    return state.copyWith(timePeriod: e.time, unSavedChanges: true);
  }

  CostumeFormState _fashionSelectedHandler(FashionSelected e) {
    return state.copyWith(fashion: e.fashion, unSavedChanges: true);
  }

  CostumeFormState _quantityChangedHandler(QuantityChanged e) {
    return state.copyWith(quantity: e.quantity, unSavedChanges: true);
  }

  CostumeFormState _colorAddedEventHandler() {
    if (state.currentColor.isNotEmpty) {

      var colorToAdd = state.currentColor.toLowerCase();
      colorToAdd = colorToAdd.trim();

      final colors = state.colors!.toList();
      final alreadyAdded = colors.contains(colorToAdd);

      if(!alreadyAdded) {
        colors.add(colorToAdd);

        return state.copyWith(
            colors: colors, currentColor: "", unSavedChanges: true);
      }
    }

    return state;

  }

  Stream<CostumeFormState> _loadFormOptionsEventHandler() async* {
    final categoryOptions = await _costumeService.getCategories();
    final timePeriodOptions = await _costumeService.getTimePeriods();
    final storageOptions = await _costumeService.getStorageMainLocations();

    yield state.copyWith(
        loading: false,
        categoryOptions: categoryOptions,
        timePeriodOptions: timePeriodOptions,
        storageMainLocationOptions: storageOptions,
        unSavedChanges: true);
  }

  void _saveChangesPressedEventHandler() {}

  Stream<CostumeFormState> _saveCostumeEventHandler() async* {
    if (state.id != null) {
      _updateCostume();
      yield state.copyWith(unSavedChanges: false);
    } else {
      final String? id = await createCostume();
      yield state.copyWith(id: id, unSavedChanges: false);
    }
    NavigationService.instance!.pop();
  }

  Future<String?> createCostume() async {
    final Costume costume = costumeFromState();
    return _costumeService.createCostume(costume);
  }

  void _updateCostume() {
    final Costume costume = costumeFromState();
    _costumeService.updateCostume(costume);
  }

  CostumeFormState _themeValueEventHandler(ThemeValueChanged e) {
    return state.copyWith(currentTheme: e.theme, unSavedChanges: true);
  }

  CostumeFormState _addTheme() {

    if (state.currentTheme.isNotEmpty) {

      var themeToAdd = state.currentTheme.toLowerCase();
      themeToAdd = themeToAdd.trim();

      final themes = state.themes!.toList();
      final alreadyAdded = themes.contains(themeToAdd);

      if(!alreadyAdded) {
        themes.add(themeToAdd);

        return state.copyWith(
            themes: themes, currentTheme: "", unSavedChanges: true);
      }
    }

    return state;
  }

  CostumeFormState colorRemovedEventHandler(ColorRemoved e) {
    final colors = state.colors!.toList();
    colors.remove(e.color);
    return state.copyWith(colors: colors, unSavedChanges: true);
  }

  CostumeFormState themeRemovedEventHandler(ThemeRemoved e) {
    final themes = state.themes!.toList();
    themes.remove(e.theme);
    return state.copyWith(themes: themes, unSavedChanges: true);
  }

  CostumeFormState colorValueChangedEventHandler(ColorValueChanged e) {
    return state.copyWith(currentColor: e.color, unSavedChanges: true);
  }

  Stream<CostumeFormState> mainLocationSelectedEventHandler(
      MainLocationSelected e) async* {
    final mainLocation = e.main;

    yield state.copyWith(mainLocation: mainLocation, unSavedChanges: true);

    final subLocationsOptions =
        await _costumeService.getStorageSubLocations(mainLocation.id!);

    yield state.copyWith(
        storageSubLocationOptions: subLocationsOptions, unSavedChanges: true);
  }

  CostumeFormState subLocationSelectedEventHandler(SubLocationSelected e) {
    return state.copyWith(subLocation: e.location, unSavedChanges: true);
  }

  Stream<CostumeFormState> _loadCostumeEventHandler(LoadCostume e) async* {
    final costume = await _costumeService.getCostume(e.costumeId!);

    if (costume != null) {
      List<Location> subLocationOptions = <Location>[];
      if (costume.storageLocation?.main != null) {
        final options = await _costumeService
            .getStorageSubLocations(costume.storageLocation!.main!.id!);
        subLocationOptions = options;
      }

      yield _statefromCostume(costume)
          .copyWith(storageSubLocationOptions: subLocationOptions);
    }
  }

  Stream<CostumeFormState> _addImageHandler(AddImage e) async* {
   /* String? id = state.id;
    if (id == null) {
      id = await createCostume();
      _costumeService.addImage(e.imagePath, id!);
      yield state.copyWith(id: id);
    } else {
      _costumeService.addImage(e.imagePath, id); } */
    imageWatcher.add(CostumeImageWatcherEvent.addImage(e.imagePath));
  }

  CostumeFormState _statefromCostume(Costume costume) {
    return state.copyWith(
        id: costume.id,
        fashion: costume.fashion,
        category: costume.category,
        timePeriod: costume.timePeriod,
        themes: costume.themes,
        colors: costume.colors,
        productions: costume.productions,
        quantity: costume.quantity,
        mainLocation: costume.storageLocation?.main,
        subLocation: costume.storageLocation?.subLocation,
        images: costume.images);
  }

  Costume costumeFromState() {
    final storage = StorageLocation(
        main: state.mainLocation, subLocation: state.subLocation);

    return Costume(
        id: state.id,
        fashion: state.fashion,
        category: state.category,
        timePeriod: state.timePeriod,
        created: state.created ?? DateTime.now(),
        edited: DateTime.now(),
        themes: state.themes,
        colors: state.colors,
        productions: state.productions,
        storageLocation: storage,
        images: state.images);
  }

  Stream<CostumeFormState> _deleteImageEventHandler(DeleteImage e) async* {
    /*final images = state.images;
    images.remove(e.image);

    yield state.copyWith(images: images);
    _costumeService.deleteImage(state.id!, e.image); */
    imageWatcher.add(CostumeImageWatcherEvent.deleteImage(e.image));
  }
}