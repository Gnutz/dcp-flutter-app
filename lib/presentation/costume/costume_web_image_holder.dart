import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/shared/constants.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CostumeWebImageHolder extends StatelessWidget {
  const CostumeWebImageHolder({
    Key? key,
    CostumeImage? image,
  })
      : image = image,
        super(key: key);

  final CostumeImage? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? ExtendedImage.network(
      image!.path,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const CircularProgressIndicator();
          case LoadState.failed:
            return const Center(child: Text(StringsConstants.error));
          case LoadState.completed:
            return ExtendedRawImage(
                image: state.extendedImageInfo?.image, fit: BoxFit.fill);
        }
      },
      width: 100,
      height: 100,
      fit: BoxFit.fill,
      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      //cancelToken: cancellationToken,
    )
        : const Placeholder();
  }

}

