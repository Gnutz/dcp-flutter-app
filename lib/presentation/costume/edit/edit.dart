import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:digtial_costume_platform/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CostumeEditPage extends StatefulWidget {
  final Function? toggleView;

  const CostumeEditPage({this.toggleView});

  @override
  _CostumeEditPageState createState() => _CostumeEditPageState();
}

class _CostumeEditPageState extends State<CostumeEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _timePeriods = <String>['1920', '1930', '1940', '1950'];
  final _categories = <String>["Dress", "Skirt", "Shirt"];
  final _storageLocations = <String>["Lille garderobe - 13"];

  final _themeHolder = TextEditingController();
  final _colorHolder = TextEditingController();

  final _costume = Costume(
    id: "0",
    fashion: Fashion.mens,
    timeperiod: "1920",
    category: "Shirt",
    quantity: 1,
    colors: ["blue", "green"],
    themes: [
      'first theme',
      'second theme',
      'third theme',
      'fourth',
      'fifth',
      'fifth',
      'fifth',
      'fifth',
      'fifth',
      'fifth'
    ],
    productions: [
      Production(
          title: "first", startDate: DateTime.now(), endDate: DateTime.now()),
      Production(
          title: "second", startDate: DateTime.now(), endDate: DateTime.now()),
      Production(
          title: "third", startDate: DateTime.now(), endDate: DateTime.now())
    ],
    storageLocation: "Lille garderobe - 13",
  );

  final _error = "";
  var _loading = false;

  String _currentTheme = "";
  String _currentColor = "";

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text(AppLocalizations.of(context)!.signUp),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView!();
                    },
                    icon: const Icon(Icons.person),
                    label: Text(AppLocalizations.of(context)!.signIn))
              ],
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
                          const SizedBox(height: 12.0),
                          _buildErrorDisplay(),
                        ],
                      ),
                    ),
                  ),
                )),
          );
  }

  Widget _buildCategorySelection() {
    return DropdownButtonFormField<String>(
        decoration: textInputDecorator.copyWith(
            hintText: "Select the costume's category"),
        items: _categories
            .map((category) =>
                DropdownMenuItem(value: category, child: Text(category)))
            .toList(),
        validator: (val) =>
            _costume.category == val ? "You must select a category" : null,
        onChanged: (category) {
          setState(() {
            _costume.category = category;
          });
        },
        value: _costume.category);
  }

  Widget _buildTimeSelection() {
    return DropdownButtonFormField<String>(
        decoration: textInputDecorator.copyWith(
            hintText: "Select the costume's time period"),
        validator: (val) => _costume.timeperiod == null
            ? "You must select a time period"
            : null,
        items: _timePeriods
            .map((time) => DropdownMenuItem(value: time, child: Text(time)))
            .toList(),
        onChanged: (time) {
          setState(() {
            _costume.timeperiod = time;
          });
        },
        value: _costume.timeperiod);
  }

  Widget _buildSubmitButton() {
    return const ElevatedButton(
      onPressed: null,
      //color: Colors.pink[400],
      child: Text("Save", style: TextStyle(color: Colors.white)),
      //disabledColor: Colors.cyan,
    );
  }

  Widget _buildErrorDisplay() {
    return Text(
      _error,
      style: const TextStyle(color: Colors.red, fontSize: 14.0),
    );
  }

  Widget _buildFashionSelection() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
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
                  groupValue: _costume.fashion,
                  onChanged: (val) => setState(() => _costume.fashion = val)),
              const Text("Men's")
            ]),
            Row(children: [
              Radio<Fashion>(
                  value: Fashion.womens,
                  groupValue: _costume.fashion,
                  onChanged: (val) => setState(() => _costume.fashion = val)),
              const Text("Women's")
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
          controller: _themeHolder,
          decoration: textInputDecorator.copyWith(hintText: "New Theme"),
          onChanged: (val) {
            setState(() => _currentTheme = val);
          },
          onFieldSubmitted: (_) => _submitTheme(),
        ),
      ),
      const SizedBox(width: 8.0),
      ElevatedButton(
        onPressed: _submitTheme,
        child: const Text("Add", style: const TextStyle(color: Colors.white)),
      ),
    ]);
  }

  Widget _buildColorsInput() {
    return Row(children: [
      Flexible(
        child: TextFormField(
          controller: _colorHolder,
          decoration: textInputDecorator.copyWith(hintText: "New Color"),
          onChanged: (val) {
            setState(() => _currentColor = val);
          },
          onFieldSubmitted: (_) => _submitColor(),
        ),
      ),
      const SizedBox(width: 8.0),
      ElevatedButton(
        onPressed: _submitColor,
        child: const Text("Add", style: const TextStyle(color: Colors.white)),
      ),
    ]);
  }

  void _submitTheme() {
    if (_currentTheme.isNotEmpty) {
      setState(() {
        _costume.themes!.add(_currentTheme);
        _currentTheme = "";
      });
      _themeHolder.clear();
    }
  }

  void _submitColor() {
    if (_currentColor.isNotEmpty) {
      setState(() {
        _costume.colors!.add(_currentColor);
        _currentColor = "";
      });
      _colorHolder.clear();
    }
  }

  Widget _buildThemesList() {
    return _buildChipList(_costume.themes!);
  }

  Widget _buildColorsList() {
    return _buildChipList(_costume.colors!);
  }

  Widget _buildChipList(List<String> chips) {
    return Wrap(
      children: chips
          .map<Widget>((chip) => Chip(
        label: Text(chip,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
                deleteIcon: const Icon(Icons.close),
                onDeleted: () => setState(() => chips.remove(chip)),
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
              const Text(
                'Storage',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                  decoration: textInputDecorator.copyWith(
                      hintText: "Select where the costume is stored"),
                  items: _storageLocations
                      .map((storage) => DropdownMenuItem(
                          value: storage, child: Text(storage)))
                      .toList(),
                  onChanged: (storage) {
                    setState(() {
                      _costume.storageLocation = storage;
                    });
                  },
                  value: _costume.storageLocation),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                  decoration: textInputDecorator.copyWith(
                      hintText: "Select where the costume is stored"),
                  items: _storageLocations
                      .map((storage) => DropdownMenuItem(
                          value: storage, child: Text(storage)))
                      .toList(),
                  onChanged: (storage) {
                    setState(() {
                      _costume.storageLocation = storage;
                    });
                  },
                  value: _costume.storageLocation),
            ],
          ),
        ));
  }
}
