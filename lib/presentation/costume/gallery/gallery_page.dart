import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final CostumeQuery query;

  const GalleryPage({required this.query});

  @override
  Widget build(BuildContext context) {
    final String category = query.category ?? "test";
    return Text(category);

    //TODO: add to search Bloc
  }
}
