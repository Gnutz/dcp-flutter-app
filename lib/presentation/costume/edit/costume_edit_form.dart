import 'package:digtial_costume_platform/bloc/costume/edit/costume_form_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/fashion.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import '../costume_image_holder.dart';

class CostumeEditForm extends StatelessWidget {
  late final CostumeFormBloc _formBloc;
  final _themeHolder = TextEditingController();
  final _colorHolder = TextEditingController();
  late BuildContext _context;
  late CostumeFormState _state;
  AppLocalizations? _appLocation;

  @override
  Widget build(BuildContext context) {
    _formBloc = context.read<CostumeFormBloc>();

    return BlocBuilder<CostumeFormBloc, CostumeFormState>(
        builder: (context, state) {
      _context = context;
      _state = state;
      _appLocation = AppLocalizations.of(_context);

      return WillPopScope(
          onWillPop: () => _popPage(),
          child: Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 42),
              child: Form(
                  child: Container(
                      alignment: Alignment.center,
                      child: CustomScrollView(slivers: [
                        SliverList(
                            delegate: SliverChildListDelegate([
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
                          _buildQuantityInput(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildAddImageButton(),
                          const SizedBox(
                            height: 20.0,
                          )
                        ])),
                        SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 4,
                                  crossAxisCount: 4),
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return GridTile(
                                    header: GridTileBar(
                                        trailing: IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () {
                                        _formBloc.add(CostumeFormEvent.deleteImage(state.images[index]));
                                      },
                                    )),
                                    child: CostumeImageHolder(
                                        image: _state.images[index]));
                          }, childCount: state.images.length),
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate(
                          [
                            _buildSubmitButton(),
                          ],
                        ))
                      ])))));
    });
  }

  Widget _buildCategorySelection() {
    return DropdownButtonFormField<String>(
        decoration: textInputDecorator.copyWith(
            hintText: AppLocalizations.of(_context)!.selectTheCostumeCategory),
        items: _state.categoryOptions
            .map((category) => DropdownMenuItem<String>(
                value: category, child: Center(child: Text(category))))
            .toList(),
        onChanged: (category) {
          _formBloc.add(CostumeFormEvent.categorySelected(category!));
        },
        value: _state.categoryOptions.isNotEmpty ? _state.category : null);
  }

  Widget _buildTimeSelection() {
    return DropdownButtonFormField<String>(
        decoration: textInputDecorator.copyWith(
            hintText:
                AppLocalizations.of(_context)!.selectTheCostumeTimePeriod),
        items: _state.timePeriodOptions
            .map((time) =>
                DropdownMenuItem(value: time, child: Center(child: Text(time))))
            .toList(),
        onChanged: (time) {
          _formBloc.add(CostumeFormEvent.timePeriodSelected(time!));
        },
        value: _state.timePeriod);
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () => _formBloc.add(const CostumeFormEvent.saveCostume()),
      child: Text(AppLocalizations.of(_context)!.save,
          style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildFashionSelection() {
    return Container(
      decoration: const BoxDecoration(
          color: MyColorTheme.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
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
          onFieldSubmitted: (_) => _submitTheme()
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
          onFieldSubmitted: (_) => _submitColor(),
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
            border: Border.all(),
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
                          value: main, child: Text(main.location)))
                      .toList(),
                  onChanged: (main) => _formBloc
                      .add(CostumeFormEvent.mainLocationSelected(main!)),
                  value: _state.storageMainLocationOptions.isNotEmpty
                      ? _state.mainLocation
                      : null),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<Location>(
                  decoration: textInputDecorator.copyWith(
                      hintText: AppLocalizations.of(_context)!
                          .selectWhereTheCostumeIsStored),
                  items: _state.storageSubLocationOptions
                      .map((location) => DropdownMenuItem<Location>(
                          value: location, child: Text(location.location)))
                      .toList(),
                  onChanged: (location) => _formBloc
                      .add(CostumeFormEvent.subLocationSelected(location!)),
                  value: _state.storageSubLocationOptions.isNotEmpty
                      ? _state.subLocation
                      : null),
            ],
          ),
        ));
  }

  Future<bool> _popPage() async {
    if (!_state.unSavedChanges) return true;
    return await showDialog(
        context: _context,
        builder: (context) => AlertDialog(
              title: Text(AppLocalizations.of(_context)!.areYouSure),
              content:
                  Text(AppLocalizations.of(_context)!.discardUnSavedChanges),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(AppLocalizations.of(_context)!.cancel),
                ),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(AppLocalizations.of(_context)!.confirm)),
              ],
            )) as bool;
  }

  Widget _buildQuantityInput() {
    return TextFormField(
      decoration: textInputDecorator.copyWith(
          hintText: AppLocalizations.of(_context)!.quantity),
      onChanged: (quantity) =>
          _formBloc.add(CostumeFormEvent.quantityChanged(int.parse(quantity))),
    );
  }

  Widget _buildAddImageButton() {
    return IconButton(
        icon: const Icon(Icons.photo_library),
        onPressed: () => _pickImage(ImageSource.gallery));
  }

  void _pickImage(ImageSource source) async {
    final PickedFile? selected = await ImagePicker().getImage(source: source);
    if (selected != null) {
      _formBloc.add(CostumeFormEvent.addImage(selected.path));
    }
  }
}
