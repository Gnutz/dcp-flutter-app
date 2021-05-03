import 'package:digtial_costume_platform/application/gallery/gallery_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../routes/routes.dart';

class Gallery extends StatelessWidget {
  CostumeQuery query;

  Gallery(this.query);

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

      return RefreshIndicator(
          onRefresh: () async => _bloc.add(GalleryEvent.performQuery(query)),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => InkWell(
                      onTap: () => NavigationService.instance!.pushNamed(
                          Routes.costumeDetails,
                          arguments: _state.costumes![index]),
                      child: state.costumes![index].images.isNotEmpty
                          ? ExtendedImage.network(
                              _state.costumes![index].images.first.downloadUrl,
                              loadStateChanged: (ExtendedImageState state) {
                                switch (state.extendedImageLoadState) {
                                  case LoadState.loading:
                                    return const CircularProgressIndicator();
                                  case LoadState.failed:
                                    return const Text('failed');
                                  case LoadState.completed:
                                    return ExtendedRawImage(
                                        image: state.extendedImageInfo?.image,
                                        fit: BoxFit.fill);
                                }
                              },
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              //cancelToken: cancellationToken,
                            )
                          : Container(
                              color: Colors.red,
                            ),
                    ),
                itemCount: _state.costumes?.length ?? 0),
          ));
    });
  }
}
