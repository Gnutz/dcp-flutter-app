import 'package:digtial_costume_platform/application/costume/details/costume_details_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/presentation/costume/details/production_card.dart';
import 'package:digtial_costume_platform/presentation/routes/routes.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:digtial_costume_platform/shared/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'production_card.dart';

class CostumeDetailsDisplay extends StatelessWidget {
  late final CostumeDetailsBloc _detailsBloc;
  late BuildContext _context;
  late CostumeDetailsState _state;
  AppLocalizations? _appLocation;

  final Costume costume;

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
    return BlocBuilder<CostumeDetailsBloc, CostumeDetailsState>(
        builder: (context, state) {
      _context = context;
      _state = state;
      _appLocation = AppLocalizations.of(_context);

      return Container(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildImageCarousel(),
              //TODO: needs to change depending on user dependency injection
              _buildActionsRow(),
              _buildStatRow(),
              // Colors and themes, secondary information
              const SizedBox(height: 10.0),
              _buildThemeAndColorList(),
              _buildStatusField(),
              const SizedBox(height: 10.0),
              _buildProductionsList(),
              //TODO: Add images section
              //FloatingActionButton(onPressed: null)
            ],
          ),
        ),
      );
    });
  }

  Widget _buildStatRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      _buildIconCard(fashionToIconPath(costume.fashion!)!),
      _buildIconCard("images/icons/costume_categories/${costume.category}.png"),
      Text(
          '${costume.category!.capitalize()}, ${costume.timePeriod}, x${costume.quantity}',
          style: TextStyle(
              fontSize: 24.0,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold)),
    ]);
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
    Widget statusChild = Text("");
    String label = "";

    print(costume.status.runtimeType);

    switch (costume.status.runtimeType) {
      case InStorage:
        final status = costume.status! as InStorage;
        label = "In Storage at:";
        statusChild = Text(
            "${status.location.main.name}, ${status.location.subLocation.name}");
        break;
      case InUse:
        final status = costume.status! as InUse;
        label = "In use for:";
        statusChild = ProductionCard(production: status.inUseFor!);
        break;

      case RentedOut:
        label = "Rented Out";
        statusChild = Text("");
        break;
    }

    return Column(children: [Text(label), statusChild]);
  }

  Widget _buildActionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 20.0),
        const IconButton(icon: Icon(Icons.add), onPressed: null),
        IconButton(icon: const Icon(Icons.edit), onPressed: _editCostume),
        IconButton(
            icon: const Icon(Icons.delete_outline), onPressed: _deleteCostume),
        ElevatedButton(
            onPressed: null,
            child: Text(AppLocalizations.of(_context)!.checkOut)),
        const SizedBox(width: 20.0),
      ],
    );
  }

  void _deleteCostume() async {
    final result = await _openDeleteConfirmationDialog();
    //TODO: delete via bloc
    NavigationService.instance!.pop();
  }

  void _checkOutCostume() {}

  void _addToCostumeList() {}

  void _editCostume() {
    NavigationService.instance!
        .pushNamed(Routes.costumesEdit, arguments: costume.id);
  }

  Future<bool> _openDeleteConfirmationDialog() async {
    return await showDialog(
        //TODO need to track dirty
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

  Widget buildImageCarousel() {
    return Image.asset("images/test.jpg", width: 20, scale: 1.5);
  }

  Widget _buildThemeAndColorList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        createWrappedTagList(
            AppLocalizations.of(_context)!.themes, costume.themes!),
        const SizedBox(height: 10.0),
        createWrappedTagList(
            AppLocalizations.of(_context)!.colors, costume.colors!),
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
            _appLocation!.productionLastTen,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Column(children: [
            ...costume.productions!
                .map<Widget>(
                    (production) => ProductionCard(production: production))
                .toList(),
            ElevatedButton(
                onPressed: () {},
                child: Text(_appLocation!.seeAll,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600])))
            //TODO: Add link to fetch all productions
          ]),
        ]),
      ),
    );
  }
}
