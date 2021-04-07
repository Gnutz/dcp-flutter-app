/*
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
    timePeriod: "1920",
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
    storageLocation: StorageLocation(id: "eee", location: "Lille garderobe - 13"),
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
            hintText: AppLocalizations.of(context)!.selectTheCostumeCategory),
        items: _categories
            .map((category) =>
                DropdownMenuItem(value: category, child: Text(category)))
            .toList(),
        validator: (val) =>
            _costume.category == val ? AppLocalizations.of(context)!.youMustSelectACategory : null,
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
            hintText: AppLocalizations.of(context)!.selectTheCostumeTimePeriod),
        validator: (val) => _costume.timePeriod == null
            ? AppLocalizations.of(context)!.youMustSelectATimePeriod
            : null,
        items: _timePeriods
            .map((time) => DropdownMenuItem(value: time, child: Text(time)))
            .toList(),
        onChanged: (time) {
          setState(() {
            _costume.timePeriod = time;
          });
        },
        value: _costume.timePeriod);
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: null,
      //color: Colors.pink[400],
      child: Text(AppLocalizations.of(context)!.save, style: TextStyle(color: Colors.white)),
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
                  groupValue: _costume.fashion,
                  onChanged: (val) => setState(() => _costume.fashion = val)),
              Text(AppLocalizations.of(context)!.mens)
            ]),
            Row(children: [
              Radio<Fashion>(
                  value: Fashion.womens,
                  groupValue: _costume.fashion,
                  onChanged: (val) => setState(() => _costume.fashion = val)),
              Text(AppLocalizations.of(context)!.womens)
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
          decoration: textInputDecorator.copyWith(hintText:AppLocalizations.of(context)!.newTheme),
          onChanged: (val) {
            setState(() => _currentTheme = val);
          },
          onFieldSubmitted: (_) => _submitTheme(),
        ),
      ),
      const SizedBox(width: 8.0),
      ElevatedButton(
        onPressed: _submitTheme,
        child: Text(AppLocalizations.of(context)!.add, style: const TextStyle(color: Colors.white)),
      ),
    ]);
  }

  Widget _buildColorsInput() {
    return Row(children: [
      Flexible(
        child: TextFormField(
          controller: _colorHolder,
          decoration: textInputDecorator.copyWith(hintText: AppLocalizations.of(context)!.newColor),
          onChanged: (val) {
            setState(() => _currentColor = val);
          },
          onFieldSubmitted: (_) => _submitColor(),
        ),
      ),
      const SizedBox(width: 8.0),
      ElevatedButton(
        onPressed: _submitColor,
        child: Text(AppLocalizations.of(context)!.add, style: const TextStyle(color: Colors.white)),
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
              Text(
                AppLocalizations.of(context)!.storage,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                  decoration: textInputDecorator.copyWith(
                      hintText: AppLocalizations.of(context)!.selectWhereTheCostumeIsStored),
                  items: _storageLocations
                      .map((storage) => DropdownMenuItem(
                          value: storage, child: Text(storage)))
                      .toList(),
                  onChanged: (storage) {
                    setState(() {
                      _costume.storageLocation = StorageLocation(id: _costume.storageLocation!.id, location: storage!);
                    });
                  },
                  value: _costume.storageLocation!.location),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                  decoration: textInputDecorator.copyWith(
                      hintText: AppLocalizations.of(context)!.selectWhereTheCostumeIsStored),
                  items: _storageLocations
                      .map((storage) => DropdownMenuItem(
                          value: storage, child: Text(storage)))
                      .toList(),
                  onChanged: (storage) {
                    setState(() {
                      _costume.storageLocation = StorageLocation(id: _costume.storageLocation!.id, location: storage!);
                    });
                  },
                  value: _costume.storageLocation!.location),
            ],
          ),
        ));
  }
}
*/
