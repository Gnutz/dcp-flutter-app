import 'package:digtial_costume_platform/application/gallery/gallery_bloc.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../routes/routes.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late BuildContext _context;
  late List<String> downLoadLinks = <String>[];
  late GalleryBloc _bloc;
  late GalleryState _state;
  late AppLocalizations? _localization;

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<GalleryBloc>();

    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      _context = context;
      _state = state;
      _localization = AppLocalizations.of(_context);
      _state.costumes!.forEach((e) {
        print("category: ${e.category}");
        print("images: ${e.images?.length}");

        e.images!.forEach((element) {
          print(element.downloadUrl);
        });
      });
      print('test');

      return WillPopScope(
          onWillPop: () => _popPage(),
          child: Container(
              child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => InkWell(
                          onTap: () => NavigationService.instance!.pushNamed(
                              Routes.costumeDetails,
                              arguments: _state.costumes![index]),
                          child: _state.costumes != null &&
                                  _state.costumes!.isNotEmpty
                              ? ExtendedImage.network(
                                  _state.costumes![index].images!.first
                                      .downloadUrl!,
                                  loadStateChanged: (ExtendedImageState state) {
                                    switch (state.extendedImageLoadState) {
                                      case LoadState.loading:
                                        return CircularProgressIndicator();
                                      case LoadState.failed:
                                        return Text('failed');
                                      case LoadState.completed:
                                        return ExtendedRawImage(
                                            image:
                                                state.extendedImageInfo?.image,
                                            fit: BoxFit.fill);
                                    }
                                  },
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fill,
                                  cache: true,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  //cancelToken: cancellationToken,
                                )
                              : Container(
                                  color: Colors.red,
                                ),
                        ),
                    itemCount: _state.costumes?.length ?? 0),
              ))
            ],
          )));
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class ImagePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
