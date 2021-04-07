import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:flutter/material.dart';

class GalleryService implements IGalleryService {
  Institution? _currentInstitution;

  final _categories = <CostumeCategory>[
    CostumeCategory(category: "Dresses", iconUri: Icons.looks_one),
    CostumeCategory(category: "Shoes", iconUri: Icons.looks_two),
    CostumeCategory(category: "T-shirts", iconUri: Icons.looks_3),
    CostumeCategory(category: "Skirts", iconUri: Icons.looks_4),
  ];

  @override
  // TODO: implement categories
  List<CostumeCategory> get categories => _categories;

  @override
  // TODO: implement currentInstitution
  Institution? get currentInstitution => this._currentInstitution;

  @override
  void setCurrentInstitution(Institution institution) {
    _currentInstitution = institution;
  }
}