
import 'dart:io';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:flutter/material.dart';

class CostumeLocalImageHolder extends StatelessWidget {
  const CostumeLocalImageHolder({
    Key? key,
    required CostumeImage image,
  })
      : image = image,
        super(key: key);

  final CostumeImage image;

  @override
  Widget build(BuildContext context) {
    return Image.file(File(image.path!));
  }
}