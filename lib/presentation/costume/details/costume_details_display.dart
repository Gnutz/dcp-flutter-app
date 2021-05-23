import 'package:carousel_slider/carousel_slider.dart';
import 'package:digtial_costume_platform/bloc/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/bloc/costume/details/costume_details_bloc.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_list.dart';
import 'package:digtial_costume_platform/domain/costume/fashion.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:digtial_costume_platform/presentation/costume/details/production_card.dart';
import 'package:digtial_costume_platform/shared/string_extension.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared/constants.dart';
import 'production_card.dart';

class CostumeDetailsDisplay extends StatelessWidget {
  late final CostumeDetailsBloc _detailsBloc;
  late final AuthBloc _auth;
  late BuildContext _context;
  late CostumeDetailsState _state;
  AppLocalizations? _appLocalzation;
  Costume costume;

  CostumeDetailsDisplay({required this.costume});

  String fashionToIconPath(Fashion? fashion) {
    const basePath = "images/icons/fashion_types";
    return '$basePath/${FashionEnumToStringMapper.fashionToString(fashion!)}.png';
    }


  String categoryToIconPath(category) {
    return "images/icons/costume_categories/$category.png";
  }

  @override
  Widget build(BuildContext context) {
    _detailsBloc = context.read<CostumeDetailsBloc>();
    _auth = context.read<AuthBloc>();
    return BlocBuilder<CostumeDetailsBloc, CostumeDetailsState>(
        builder: (context, state) {
      _context = context;
      _state = state;
      _appLocalzation = AppLocalizations.of(_context);

      if (_state.costume != null) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (state.costume!.images.isNotEmpty) buildImageCarousel(),
                  _buildActionsRow(),
                  _buildStatRow(),
                  // Colors and themes, secondary information
                  const SizedBox(height: 10.0),
                  _buildThemeAndColorList(),
                  _buildStatusField(),
                  const SizedBox(height: 10.0),
                  _buildProductionsList(),
                  //TODO: Add images section
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

  Widget _buildStatRow() {
    final Costume? costume = _state.costume;
    if (costume != null) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildIconCard(fashionToIconPath(costume.fashion)),
            _buildIconCard(categoryToIconPath(costume.category)),
            if (costume.category != null && costume.category!.isNotEmpty)
              _getTextSegment('${costume.category!.capitalize()},'),
            if (costume.timePeriod != null && costume.category!.isNotEmpty)
              _getTextSegment('${_state.costume!.timePeriod!.capitalize()},'),
              _getTextSegment('x${_state.costume!.quantity}')
          ]);
    }
    return Row();
  }

  Widget _getTextSegment(String  text) {
    return Text(text,
        style: TextStyle(
            fontSize: 24.0,
            color: Colors.grey[600],
            fontWeight: FontWeight.bold));
  }

  Widget _buildIconCard(String imagePath) {
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

  Widget _buildStatusField() {
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
    return Column(children: [Text(label), statusChild]);
  }

  Widget _buildActionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 20.0),
        IconButton(icon: const Icon(Icons.add), onPressed: _addCostumeToList),
        if (_auth.state.user!.isCreator) ...[
          IconButton(icon: const Icon(Icons.edit), onPressed: _editCostume),
          IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _deleteCostume),
          ElevatedButton(
              onPressed:
                  _state.costume!.status is InUse ? null : _checkOutCostume,
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
    }
  }

  Future<bool> _openDeleteConfirmationDialog() async {
    return await showDialog(
        context: _context,
        builder: (context) => AlertDialog(
              content: const Text(
                  StringsConstants.areYouSureYouWantToDeleteThisCostume),
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
    final productions = _state.productionOptions;

    return await showDialog(
        context: _context,
        builder: (BuildContext context) => AlertDialog(
                title: const Text(StringsConstants.selectAProduction),
                content: DropdownButtonFormField<Production>(
                    value: selected,
                    items: productions
                        .map((production) => DropdownMenuItem<Production>(
                            value: production,
                            child: Wrap(children: [Text(production.title)])))
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
    _detailsBloc.add(const CostumeDetailsEvent.editCostumePressed());
  }

  Widget buildImageCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 400.0,
          enableInfiniteScroll: false,
          enlargeCenterPage: true, initialPage: (costume.images.length /2).floor(),
        scrollDirection: Axis.horizontal),
      items: costume.images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return ExtendedImage.network(
              image.path,
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    return const CircularProgressIndicator();
                  case LoadState.failed:
                    return const Text('');
                  case LoadState.completed:
                    return ExtendedRawImage(
                        image: state.extendedImageInfo?.image,
                        fit: BoxFit.fill);
                }
              },
              fit: BoxFit.fill,
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              //cancelToken: cancellationToken,
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildThemeAndColorList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        createWrappedTagList(
            AppLocalizations.of(_context)!.themes, _state.costume!.themes),
        const SizedBox(height: 10.0),
        createWrappedTagList(
            AppLocalizations.of(_context)!.colors, _state.costume!.colors),
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
          const Text(
            StringsConstants.productions,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Column(children: [
            ..._state.costume!.productions
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
                title: const Text(StringsConstants.selectAListToAddCostumeTo),
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
