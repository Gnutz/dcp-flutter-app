import 'package:digtial_costume_platform/application/gallery/gallery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Gallery extends StatelessWidget {
  late final GalleryBloc _bloc;
  late BuildContext _context;
  late GalleryState _state;
  AppLocalizations? _appLocation;

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<GalleryBloc>();

    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      _context = context;
      _state = state;
      _appLocation = AppLocalizations.of(_context);

      return WillPopScope(
        onWillPop: () => _popPage(),
        child: Container(),
      );
    });
  }

  Future<bool> _popPage() async {
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
}
