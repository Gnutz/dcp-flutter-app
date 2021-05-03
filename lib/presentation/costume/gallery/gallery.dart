import 'package:digtial_costume_platform/application/gallery/gallery_bloc.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../costume_image_holder.dart';

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
                itemBuilder: (context, index) =>
                    _buildCostumeGridTile(_state.costumes[index]),
                itemCount: _state.costumes.length),
          ));
    });
  }

  Widget _buildCostumeGridTile(Costume costume) {
    return InkWell(
        onTap: () => _bloc.add(GalleryEvent.selectCostumeForDisplay(costume)),
        child: CostumeImageHolder(image: costume.images.isNotEmpty ? costume.images.first : null));
  }

}
