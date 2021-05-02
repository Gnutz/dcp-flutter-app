import 'package:digtial_costume_platform/application/gallery/search_form/search_form_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchForm extends StatelessWidget {
  late final SearchFormBloc _formBloc;
  final _categoryController = TextEditingController();
  final _productionController = TextEditingController();
  final _timeController = TextEditingController();
  final _themeController = TextEditingController();
  final _colorController = TextEditingController();
  late BuildContext _context;
  late SearchFormState _state;
  AppLocalizations? _appLocation;

  @override
  Widget build(BuildContext context) {
    _formBloc = context.read<SearchFormBloc>();

    return BlocBuilder<SearchFormBloc, SearchFormState>(
        builder: (context, state) {
      _context = context;
      _state = state;
      _appLocation = AppLocalizations.of(_context);
      _categoryController.text = _state.category ?? "";
      _timeController.text = _state.timePeriod ?? "";
      _productionController.text = _state.productionTitle ?? "";

      print(_categoryController.text);

      return Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 42),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            //TODO:
            // autovalidate: state.showInputErrorMessages,
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(children: [
                  _buildCategorySelection(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildTimeSelection(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildProductionSelection(),
                  const SizedBox(height: 20.0),
                  _buildFashionSelection(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildThemesInput(),
                  const SizedBox(height: 8.0),
                  _buildThemesList(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildColorsInput(),
                  const SizedBox(height: 8.0),
                  _buildColorsList(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _buildSubmitButton(),
                ]),
              ),
            ),
          ));
    });
  }

  Widget _buildCategorySelection() {
    return _buildSuggestionsFormField(
        _categoryController,
        _state.categoryOptions,
        "Category",
        (String category) =>
            _formBloc.add(SearchFormEvent.categorySelected(category)));
  }

  Widget _buildSuggestionsFormField(
      TextEditingController controller,
      List<String> suggestions,
      String hintText,
      void Function(String) selectSuggestionCallBack) {
    return TypeAheadFormField<String?>(
      textFieldConfiguration: TextFieldConfiguration(
          controller: controller,
          decoration: textInputDecorator.copyWith(hintText: hintText)),
      onSuggestionSelected: (suggestion) =>
          selectSuggestionCallBack(suggestion!),
      itemBuilder: (context, suggestion) => ListTile(title: Text(suggestion!)),
      suggestionsCallback: (query) => List.of(suggestions.where((suggestion) =>
          suggestion.toLowerCase().contains(query.toLowerCase()))),
      noItemsFoundBuilder: (_) => Text("Matches no available suggestions"),
      onSaved: (suggestion) => selectSuggestionCallBack(suggestion!),
    );
  }

  Widget _buildTimeSelection() {
    return _buildSuggestionsFormField(
        _timeController,
        _state.timePeriodOptions,
        "TimePeriod",
        (time) => _formBloc.add(SearchFormEvent.timePeriodSelected(time)));
  }

  Widget _buildProductionSelection() {
    return _buildSuggestionsFormField(
        _productionController,
        _state.productionOptions,
        "Production Titel",
        (productionTitle) =>
            _formBloc.add(SearchFormEvent.productionSelected(productionTitle)));
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        _formBloc.add(const SearchFormEvent.searchPressed());
        NavigationService.instance!.pop();
      },
      //color: Colors.pink[400],
      child: Text("Search", style: const TextStyle(color: Colors.white)),

      //disabledColor: Colors.cyan,
    );
  }

  Widget _buildFashionSelection() {
    return Container(
      decoration: const BoxDecoration(
          color: MyColorTheme.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(children: [
              Radio<Fashion>(
                  value: Fashion.mens,
                  groupValue: _state.fashion,
                  onChanged: (val) =>
                      _formBloc.add(SearchFormEvent.fashionSelected(val!))),
              Text(AppLocalizations.of(_context)!.mens)
            ]),
            Row(children: [
              Radio<Fashion>(
                  value: Fashion.womens,
                  groupValue: _state.fashion,
                  onChanged: (val) =>
                      _formBloc.add(SearchFormEvent.fashionSelected(val!))),
              Text(AppLocalizations.of(_context)!.womens)
            ]),
          ],
        ),
        //]),
      ),
    );
  }

  Widget _buildThemesInput() {
    //TODO: convert to lowercase
    return Row(children: [
      Flexible(
        child: TextFormField(
          decoration: textInputDecorator.copyWith(
              hintText: AppLocalizations.of(_context)!.newTheme),
          controller: _themeController,
          onChanged: (theme) =>
              _formBloc.add(SearchFormEvent.themeValueChanged(theme)),
          onFieldSubmitted: (_) => _formBloc.add(SearchFormEvent.themeAdded()),
        ),
      ),
      const SizedBox(width: 8.0),
      ElevatedButton(
        onPressed: _submitTheme,
        child: Text(AppLocalizations.of(_context)!.add,
            style: const TextStyle(color: Colors.white)),
      ),
    ]);
  }

  Widget _buildColorsInput() {
    //TODO convert to lowercase
    return Row(children: [
      Flexible(
        child: TextFormField(
          decoration: textInputDecorator.copyWith(
              hintText: AppLocalizations.of(_context)!.newColor),
          onChanged: (color) =>
              _formBloc.add(SearchFormEvent.colorValueChanged(color)),
          controller: _colorController,
        ),
      ),
      const SizedBox(width: 8.0),
      ElevatedButton(
        onPressed: _submitColor,
        child: Text(AppLocalizations.of(_context)!.add,
            style: const TextStyle(color: Colors.white)),
      ),
    ]);
  }

  void _submitTheme() {
    if (_state.currentTheme.isNotEmpty) {
      _formBloc.add(const SearchFormEvent.themeAdded());
      _themeController.clear();
    }
  }

  void _submitColor() {
    if (_state.currentColor.isNotEmpty) {
      _formBloc.add(const SearchFormEvent.colorAdded());
      _colorController.clear();
    }
  }

  Widget _buildThemesList() {
    return _buildChipList(_state.themes!, _removeTheme);
  }

  Widget _buildColorsList() {
    return _buildChipList(_state.colors!, _removeColor);
  }

  void _removeTheme(String theme) {
    _formBloc.add(SearchFormEvent.themeRemoved(theme));
  }

  void _removeColor(String color) {
    _formBloc.add(SearchFormEvent.colorRemoved(color));
  }

  Widget _buildChipList(
      List<String> chips, void Function(String val) removeCallback) {
    return Wrap(
      children: chips
          .map<Widget>((chip) => Chip(
                label: Text(chip,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
                deleteIcon: const Icon(Icons.close),
                onDeleted: () => removeCallback(chip),
              ))
          .toList(),
    );
  }
}
