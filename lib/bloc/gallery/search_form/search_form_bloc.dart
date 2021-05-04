import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/fashion.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/data/services/i_gallery_service.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_form_bloc.freezed.dart';
part 'search_form_event.dart';
part 'search_form_state.dart';

class SearchFormBloc extends Bloc<SearchFormEvent, SearchFormState> {
  final IGalleryService _galleryService;

  SearchFormBloc(this._galleryService) : super(SearchFormState.initial()) {
    add(const SearchFormEvent.loadFormOptions());
  }

  @override
  Stream<SearchFormState> mapEventToState(SearchFormEvent event) async* {
    yield* event.map(categorySelected: (e) async* {
      yield _categorySelectedEventHandler(e);
    }, timePeriodSelected: (e) async* {
      yield _timePeriodSelectedHandler(e);
    }, fashionSelected: (e) async* {
      yield _fashionSelectedHandler(e);
    }, colorSubmitted: (e) async* {
      yield _colorSubmittedEventHandler(e);
    }, loadFormOptions: (_) async* {
      yield* _loadFormOptionsEventHandler();
    }, themeValueChanged: (ThemeValueChanged e) async* {
      yield _themeValueEventHandler(e);
    }, themeSubmitted: (ThemeSubmitted e) async* {
      yield _themeSubmitted();
    }, colorRemoved: (ColorRemoved e) async* {
      yield colorRemovedEventHandler(e);
    }, themeRemoved: (ThemeRemoved e) async* {
      yield themeRemovedEventHandler(e);
    }, colorValueChanged: (ColorValueChanged e) async* {
      yield colorValueChangedEventHandler(e);
    }, searchPressed: (_) async* {
      _searchPressed();
    }, productionSelected: (ProductionSelected e) async* {
      yield _productionSelectedEventHandler(e);
    });
  }

  SearchFormState _categorySelectedEventHandler(CategorySelected e) {
    return state.copyWith(category: e.category);
  }

  SearchFormState _timePeriodSelectedHandler(TimePeriodSelected e) {
    return state.copyWith(timePeriod: e.time);
  }

  SearchFormState _fashionSelectedHandler(FashionSelected e) {
    return state.copyWith(fashion: e.fashion);
  }

  SearchFormState _colorSubmittedEventHandler(ColorSubmitted e) {

    if(state.currentColor.isNotEmpty) {
      String colorToAdd = state.currentColor.toLowerCase();
      colorToAdd = colorToAdd.trim();
      final colors = state.colors!.toList();
      final alreadyAdded = colors.contains(colorToAdd);

      if (!alreadyAdded) {
        colors.add(colorToAdd);

        return state.copyWith(
            colors: colors, currentColor: "");
      }
    }

    return state;

    /*final colors = state.colors!.toList();
    final colorToAdd = e.color.toLowerCase();
    colo
    colors.add(state.currentColor);

    return state.copyWith(colors: colors, currentColor: ""); */
  }

  Stream<SearchFormState> _loadFormOptionsEventHandler() async* {
    final categoryOptions = await _galleryService.getCategories();
    final timePeriodOptions = await _galleryService.getTimePeriods();
    final productionOptions = await _galleryService.getProductions();

    yield state.copyWith(
        categoryOptions: categoryOptions,
        timePeriodOptions: timePeriodOptions,
        productionOptions: productionOptions);
  }

  SearchFormState _themeValueEventHandler(ThemeValueChanged e) {
    return state.copyWith(currentTheme: e.theme);
  }

  SearchFormState _themeSubmitted() {
    if (state.currentTheme.isNotEmpty) {
      final themes = state.themes!.toList();
      themes.add(state.currentTheme);

      return state.copyWith(themes: themes, currentTheme: "");
    }

    return state;
  }

  SearchFormState colorRemovedEventHandler(ColorRemoved e) {
    final colors = state.colors!.toList();
    colors.remove(e.color);
    return state.copyWith(colors: colors);
  }

  SearchFormState themeRemovedEventHandler(ThemeRemoved e) {
    final themes = state.themes!.toList();
    themes.remove(e.theme);
    return state.copyWith(themes: themes);
  }

  SearchFormState colorValueChangedEventHandler(ColorValueChanged e) {
    return state.copyWith(currentColor: e.color);
  }

  void _searchPressed() {
    final query = CostumeQuery(
        production: state.production,
        themes: state.themes,
        colors: state.colors,
        category: state.category,
        fashion: state.fashion,
        timePeriod: state.timePeriod);

    final String? currentRoute = NavigationService.currentRoute;
    if (currentRoute != Routes.gallery) {
      NavigationService.instance!.pushNamed(Routes.gallery, arguments: query);
    } else {
      NavigationService.instance!
          .pushReplacementNamed(Routes.gallery, arguments: query);
    }
  }

  SearchFormState _productionSelectedEventHandler(ProductionSelected e) {
    return state.copyWith(production: e.production);
  }
}
