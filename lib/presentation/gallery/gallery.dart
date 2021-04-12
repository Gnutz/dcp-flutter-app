import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final CostumeQuery query;

  GalleryPage({required this.query});

  @override
  Widget build(BuildContext context) {
    String category = (query.category != null ? query.category : "test")!;
    return Container(child: Text(category));

    //TODO: add to search Bloc
  }
}
