import 'package:carousel_slider/carousel_slider.dart';
import 'package:digtial_costume_platform/application/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/application/costume/details/costume_details_bloc.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_list.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/locator.dart';
import 'package:digtial_costume_platform/presentation/costume/details/production_card.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:digtial_costume_platform/shared/string_extension.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'production_card.dart';

class CostumeDetailsDisplay extends StatelessWidget {
  late final CostumeDetailsBloc _detailsBloc;
  late final AuthBloc _auth;
  late BuildContext _context;
  late CostumeDetailsState _state;
  AppLocalizations? _appLocation;
  Costume costume;

  CostumeDetailsDisplay({required this.costume});

  String? fashionToIconPath(Fashion fashion) {
    const basePath = "images/icons/fashion_types";

    switch (fashion) {
      case Fashion.mens:
        return "$basePath/mens.png";
      case Fashion.womens:
        return "$basePath/womens.png";
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    _detailsBloc = context.read<CostumeDetailsBloc>();
    _auth = context.read<AuthBloc>();
    return BlocBuilder<CostumeDetailsBloc, CostumeDetailsState>(
        builder: (context, state) {
          _context = context;
          _state = state;
          _appLocation = AppLocalizations.of(_context);

          if (_state.costume != null) {
            return Container(
              margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      buildImageCarousel(),
                      _ActionsRow(),
                      _StatRow(),
                      // Colors and themes, secondary information
                      const SizedBox(height: 10.0),
                      _buildThemeAndColorList(),
                      _StatusField(),
                      const SizedBox(height: 10.0),
                      _buildProductionsList(),
                      //TODO: Add images section
                      //FloatingActionButton(onPressed: null)
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _StatRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      _IconCard(fashionToIconPath(_state.costume!.fashion!)!),
      _IconCard(
          "images/icons/costume_categories/${_state.costume!.category}.png"),
      Text(
          '${_state.costume!.category!.capitalize()}, ${_state.costume!.timePeriod}, x${_state.costume!.quantity}',
          style: TextStyle(
              fontSize: 24.0,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold)),
    ]);
  }

  Widget _IconCard(String imagePath) {
    return Card(
        color: MyColorTheme.inputDecoratorEnabledBorderOutlineSideColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        elevation: 2,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
            child: Image.asset(
              imagePath,
              height: 25,
              width: 25,
            )));
  }

  Widget _StatusField() {
    Widget statusChild = const Text("");
    String label = "";

    switch (_state.costume?.status?.runtimeType) {
      case InStorage:
        final status = _state.costume?.status as InStorage?;
        label = "In Storage at:";
        statusChild = Text(
            "${status?.location.main?.location}, ${status?.location.subLocation?.location}");
        break;
      case InUse:
        final status = _state.costume?.status as InUse?;
        if (status != null) {
          label = "In use for:";
          statusChild = ProductionCard(production: status.inUseFor!);
        }
        break;

      case RentedOut:
        label = "Rented Out";
        statusChild = const Text("");
        break;
    }

    print(_state.costume!.status.runtimeType == InStorage ? "storage" : "nej");
    print(_state.costume!.status.runtimeType == InUse ? "inUse" : "nej");
    print(_state.costume!.status.runtimeType);

    return Column(children: [Text(label), statusChild]);
  }

  Widget _ActionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 20.0),
        IconButton(icon: Icon(Icons.add), onPressed: _addCostumeToList),
        if (_auth.state.user!.isCreator) ...[
          IconButton(icon: const Icon(Icons.edit), onPressed: _editCostume),
          IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _deleteCostume),
          ElevatedButton(
              onPressed:
                  _state.costume!.status is InStorage ? _checkOutCostume : null,
              child: Text(AppLocalizations.of(_context)!.checkOut)),
          const SizedBox(width: 20.0)
        ] else
          ...[]
      ],
    );
  }

  void _deleteCostume() async {
    final result = await _openDeleteConfirmationDialog();
    if (result) {
      _detailsBloc.add(const CostumeDetailsEvent.deleteCostume());
      NavigationService.instance!.pop();
    }
  }

  Future<bool> _openDeleteConfirmationDialog() async {
    return await showDialog(
        context: _context,
        builder: (context) => AlertDialog(
          content:
                  const Text("Are you sure you want to delete this costume?"),
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

  Future<void> _checkOutCostume() async {
    final selectedProduction = await _openCheckOutDialog();
    if (selectedProduction != null) {
      _detailsBloc.add(CostumeDetailsEvent.checkOutCostume(selectedProduction));
    }
  }

  Future<Production?> _openCheckOutDialog() async {
    Production? selected;
    final productionsTitles = await Locator()
        .locator<ICostumeRepository>()
        .getProductions('fHEEOUrR8ZcsqbH19dzC');
    final productions = productionsTitles
        .map((e) => Production(
            title: e, startDate: DateTime.now(), endDate: DateTime.now()))
        .toList();

    return await showDialog(
        context: _context,
        builder: (BuildContext context) => AlertDialog(
                title: const Text("Select a production"),
                content: DropdownButtonFormField<Production>(
                    value: selected,
                    items: productions
                        .map((production) => DropdownMenuItem<Production>(
                            value: production,
                            child:
                                Wrap(children: [Text('${production.title}')])))
                        .toList(),
                    onChanged: (val) => selected = val),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(null),
                    child: Text(AppLocalizations.of(_context)!.cancel),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(selected),
                      child: Text(AppLocalizations.of(_context)!.confirm)),
                ])) as Production?;
  }

  void _editCostume() {
    NavigationService.instance!.pushReplacementNamed(Routes.costumesEdit,
        arguments: _state.costume!.id);
  }

  Widget buildImageCarousel() {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: costume.images!.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  child: ExtendedImage.network(
                image.downloadUrl!,
                loadStateChanged: (ExtendedImageState state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      return CircularProgressIndicator();
                    case LoadState.failed:
                      return Text('failed');
                    case LoadState.completed:
                      return ExtendedRawImage(
                          image: state.extendedImageInfo?.image,
                          fit: BoxFit.fill);
                  }
                },
                fit: BoxFit.fill,
                cache: true,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                //cancelToken: cancellationToken,
              ));
            },
          );
        }).toList(),
      ),
    );
    return Image.asset("images/test.jpg", width: 20, scale: 1.5);
  }

  Widget _buildThemeAndColorList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        createWrappedTagList(
            AppLocalizations.of(_context)!.themes, _state.costume!.themes!),
        const SizedBox(height: 10.0),
        createWrappedTagList(
            AppLocalizations.of(_context)!.colors, _state.costume!.colors!),
      ],
    );
  }

  Widget createWrappedTagList(String label, List<String> list) {
    return Wrap(children: [
      Text(
        '$label: ',
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      ...list
          .map<Widget>((tag) => Text(
        '$tag, ',
        style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
      ))
          .toList()
    ]);
  }

  Widget _buildProductionsList() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Text(
            "Productions",
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Column(children: [
            ..._state.costume!.productions!
                .map<Widget>(
                    (production) => ProductionCard(production: production))
                .toList()
          ]),
        ]),
      ),
    );
  }

  void _addCostumeToList() async {
    final selectedList = await _openSelectListDialog();
    if (selectedList != null) {
      _detailsBloc.add(CostumeDetailsEvent.addCostumeToList(selectedList));
    }
  }

  Future<CostumeList?>? _openSelectListDialog() async {
    CostumeList? selected;
    final List<CostumeList> productions = <CostumeList>[
      CostumeList(uid: "uid", title: "title")
    ];
    return await showDialog(
        context: _context,
        builder: (BuildContext context) => AlertDialog(
            title: Text("Title"),
            content: DropdownButtonFormField<CostumeList>(
                value: selected,
                items: productions
                    .map((list) => DropdownMenuItem<CostumeList>(
                    value: list, child: Text(list.title)))
                    .toList(),
                onChanged: (val) => selected = val),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(null),
                child: Text(AppLocalizations.of(_context)!.cancel),
              ),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(selected),
                  child: Text(AppLocalizations.of(_context)!.confirm)),
            ])) as CostumeList?;
  }
}
