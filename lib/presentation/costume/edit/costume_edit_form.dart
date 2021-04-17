import 'package:digtial_costume_platform/application/costume/costume_form_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CostumeEditForm extends StatelessWidget {
  late final CostumeFormBloc _formBloc;
  final _themeHolder = TextEditingController();
  final _colorHolder = TextEditingController();
  late BuildContext _context;
  late CostumeFormState _state;

  @override
  Widget build(BuildContext context) {
    _formBloc = context.read<CostumeFormBloc>();

    return BlocBuilder<CostumeFormBloc, CostumeFormState>(
        builder: (context, state) {
      _context = context;
      _state = state;

      return WillPopScope(
        onWillPop: () => _return(),
        child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
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
                    _buildStorageSelection(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _buildSubmitButton(),
                  ]),
                ),
              ),
            )),
      );
    });
  }

  Widget _buildCategorySelection() {
    return DropdownButtonFormField<CostumeCategory>(
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(_context)!.selectTheCostumeCategory),
        items: _state.categoryOptions
            .map((category) => DropdownMenuItem(
                value: category, child: Text(category.category)))
            .toList(),
        validator: (_) => _state.category == null
            ? AppLocalizations.of(_context)!.youMustSelectACategory
            : null,
        onChanged: (category) {
          _formBloc.add(CostumeFormEvent.categorySelected(category!));
        },
        value: _state.category);
  }

  Widget _buildTimeSelection() {
    return DropdownButtonFormField<String>(
        decoration: textInputDecorator.copyWith(
            hintText:
                AppLocalizations.of(_context)!.selectTheCostumeTimePeriod),
        validator: (val) => _state.timePeriod == null
            ? AppLocalizations.of(_context)!.youMustSelectATimePeriod
            : null,
        items: _state.timePeriodOptions
            .map((time) => DropdownMenuItem(value: time, child: Text(time)))
            .toList(),
        onChanged: (time) {
          _formBloc.add(CostumeFormEvent.timePeriodSelected(time!));
        },
        value: _state.timePeriod);
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () => _formBloc.add(CostumeFormEvent.saveCostume()),
      //color: Colors.pink[400],
      child: Text(AppLocalizations.of(_context)!.save,
          style: const TextStyle(color: Colors.white)),
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
        /*Column(children: [
          Text(
            "Fashion Type",
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ), */
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(children: [
              Radio<Fashion>(
                  value: Fashion.mens,
                  groupValue: _state.fashion,
                  onChanged: (val) =>
                      _formBloc.add(CostumeFormEvent.fashionSelected(val!))),
              Text(AppLocalizations.of(_context)!.mens)
            ]),
            Row(children: [
              Radio<Fashion>(
                  value: Fashion.womens,
                  groupValue: _state.fashion,
                  onChanged: (val) =>
                      _formBloc.add(CostumeFormEvent.fashionSelected(val!))),
              Text(AppLocalizations.of(_context)!.womens)
            ]),
          ],
        ),
        //]),
      ),
    );
  }

  Widget _buildThemesInput() {
    return Row(children: [
      Flexible(
        child: TextFormField(
          decoration: textInputDecorator.copyWith(
              hintText: AppLocalizations.of(_context)!.newTheme),
          controller: _themeHolder,
          onChanged: (theme) =>
              _formBloc.add(CostumeFormEvent.themeValueChanged(theme)),
          onFieldSubmitted: (_) =>
              _formBloc.add(const CostumeFormEvent.themeAdded()),
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
    return Row(children: [
      Flexible(
        child: TextFormField(
          decoration: textInputDecorator.copyWith(
              hintText: AppLocalizations.of(_context)!.newColor),
          onChanged: (color) =>
              _formBloc.add(CostumeFormEvent.colorValueChanged(color)),
          controller: _colorHolder,
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
      _formBloc.add(const CostumeFormEvent.themeAdded());
      _themeHolder.clear();
    }
  }

  void _submitColor() {
    if (_state.currentColor.isNotEmpty) {
      _formBloc.add(const CostumeFormEvent.colorAdded());
      _colorHolder.clear();
    }
  }

  Widget _buildThemesList() {
    return _buildChipList(_state.themes!, _removeTheme);
  }

  Widget _buildColorsList() {
    return _buildChipList(_state.colors!, _removeColor);
  }

  void _removeTheme(String theme) {
    _formBloc.add(CostumeFormEvent.themeRemoved(theme));
  }

  void _removeColor(String color) {
    _formBloc.add(CostumeFormEvent.colorRemoved(color));
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

  Widget _buildStorageSelection() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(_context)!.storage,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<Location>(
                  decoration: textInputDecorator.copyWith(
                      hintText: AppLocalizations.of(_context)!
                          .selectWhereTheCostumeIsStored),
                  items: _state.storageMainLocationOptions
                      .map((main) => DropdownMenuItem<Location>(
                          value: main, child: Text(main.name)))
                      .toList(),
                  onChanged: (main) => _formBloc
                      .add(CostumeFormEvent.mainLocationSelected(main!)),
                  value: _state.mainLocation),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<Location>(
                  decoration: textInputDecorator.copyWith(
                      hintText: AppLocalizations.of(_context)!
                          .selectWhereTheCostumeIsStored),
                  items: _state.storageSubLocationOptions
                      .map((location) => DropdownMenuItem<Location>(
                          value: location, child: Text(location.name)))
                      .toList(),
                  onChanged: (location) => _formBloc
                      .add(CostumeFormEvent.subLocationSelected(location!)),
                  value: _state.subLocation),
            ],
          ),
        ));
  }

  Future<bool> _return() async {
    return await showDialog(
        context: _context,
        builder: (context) => AlertDialog(
          title: const Text('Are you sure?'),
              content: const Text('Do you want discard the changes'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            )) as bool;
  }
}
