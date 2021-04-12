import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:flutter/material.dart';

class GalleryService implements IGalleryService {
  Institution? _currentInstitution;
  ICostumeRepository _costumeRepository;

  GalleryService(this._costumeRepository);

  final _categories = <CostumeCategory>[
    CostumeCategory(category: "Dresses", iconUri: Icons.looks_one),
    CostumeCategory(category: "Shoes", iconUri: Icons.looks_two),
    CostumeCategory(category: "T-shirts", iconUri: Icons.looks_3),
    CostumeCategory(category: "Skirts", iconUri: Icons.looks_4),
    CostumeCategory(category: "Skirts", iconUri: Icons.looks_4),
    CostumeCategory(category: "Skirts", iconUri: Icons.looks_4),
    CostumeCategory(category: "Skirts", iconUri: Icons.looks_4),
    CostumeCategory(category: "Skirts", iconUri: Icons.looks_4),
    CostumeCategory(category: "Skirts", iconUri: Icons.looks_4),
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

  @override
  Future<void> createCostume(Costume costume) async {
    _costumeRepository.createCostume(_currentInstitution!.uid!, costume);
  }

  @override
  Future<void> deleteCostume(String id) async {
    _costumeRepository.deleteCostume(_currentInstitution!.uid!, id);
  }

  @override
  Future<Costume> getCostume(String id) async {
    return await _costumeRepository.getCostume(_currentInstitution!.uid!, id);
  }

  @override
  Future<List<Costume>> getCostumes(CostumeQuery query) async {
    return await _costumeRepository.getCostumes(
        currentInstitution!.uid!, query);
  }

  @override
  Future<void> updateCostume(Costume updated) async {
    _costumeRepository.updateCostume(_currentInstitution!.uid!, updated);
  }
}