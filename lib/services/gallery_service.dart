import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';

class GalleryService implements IGalleryService {
  Institution? _currentInstitution =
      Institution(name: "aarhus Teater", uid: "fHEEOUrR8ZcsqbH19dzC");
  final ICostumeRepository _costumeRepository;

  GalleryService(this._costumeRepository);

  //TODO change
  final _categories = <CostumeCategory>[
    CostumeCategory(
        category: "dresses",
        iconUri: "images/icons/costume_categories/dress.png"),
    CostumeCategory(
        category: "shoes",
        iconUri: "images/icons/costume_categories/dress.png"),
    CostumeCategory(
        category: "t-shirts",
        iconUri: "images/icons/costume_categories/dress.png"),
    CostumeCategory(
        category: "skirts",
        iconUri: "images/icons/costume_categories/dress.png"),
    CostumeCategory(
        category: "coats",
        iconUri: "images/icons/costume_categories/dress.png"),
    CostumeCategory(
        category: "shirts",
        iconUri: "images/icons/costume_categories/dress.png"),
    CostumeCategory(
        category: "pants",
        iconUri: "images/icons/costume_categories/dress.png"),
  ];

  @override
  // TODO: implement categories
  List<CostumeCategory> get categories => _categories;

  @override
  // TODO: implement currentInstitution
  Institution? get currentInstitution => _currentInstitution;

  @override
  void setCurrentInstitution(Institution institution) {
    _currentInstitution = institution;
  }

  @override
  Future<void> createCostume(Costume costume) async {
    print(costume);
    print(_currentInstitution!.uid);
    _costumeRepository.createCostume(_currentInstitution!.uid!, costume);
  }

  @override
  Future<void> deleteCostume(String id) async {
    _costumeRepository.deleteCostume(_currentInstitution!.uid!, id);
  }

  @override
  Future<Costume?> getCostume(String id) async {
    return _costumeRepository.getCostume(_currentInstitution!.uid!, id);
  }

  @override
  Future<List<Costume>> getCostumes(CostumeQuery query) async {
    return _costumeRepository.getCostumes(
        currentInstitution!.uid!, query);
  }

  @override
  Future<void> updateCostume(Costume updated) async {
    _costumeRepository.updateCostume(_currentInstitution!.uid!, updated);
  }
}