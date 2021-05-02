
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';

class GalleryService implements IGalleryService {
  Institution? _currentInstitution =
      Institution(name: "aarhus Teater", id: "eDDNM6LeSWVzj52ThQtO");
  final ICostumeRepository _costumeRepository;

  GalleryService(this._costumeRepository);

  @override
  // TODO: implement currentInstitution
  Institution? get currentInstitution => _currentInstitution;

  @override
  void setCurrentInstitution(Institution institution) {
    _currentInstitution = institution;
  }

  @override
  Future<String?> createCostume(Costume costume) async {
    return _costumeRepository.createCostume(_currentInstitution!.id!, costume);
  }

  @override
  Future<void> deleteCostume(String id) async {
    _costumeRepository.deleteCostume(_currentInstitution!.id!, id);
  }

  @override
  Future<Costume?> getCostume(String id) async {
    return _costumeRepository.getCostume(_currentInstitution!.id!, id);
  }

  @override
  Future<List<Costume>> getCostumes(CostumeQuery query) async {
    return _costumeRepository.getCostumes(currentInstitution!.id!, query);
  }

  @override
  Future<void> updateCostume(Costume updated) async {
    _costumeRepository.updateCostume(_currentInstitution!.id!, updated);
  }

  @override
  Future<Costume?> checkOut(Costume costume, Production production) async {
    costume.productions.add(production);
    costume.status = InUse(inUseFor: production);
    await updateCostume(costume);
    return getCostume(costume.id!);
  }

  @override
  Future<List<String>> getCategories() {
    return _costumeRepository.getCategories(currentInstitution!.id!);
  }

  @override
  Future<List<Location>> getStorageMainLocations() {
    return _costumeRepository.getStorageMainLocations(currentInstitution!.id!);
  }

  @override
  Future<List<Location>> getStorageSubLocations(String mainId) {
    return _costumeRepository.getStorageSubLocations(
        currentInstitution!.id!, mainId);
  }

  @override
  Future<List<String>> getTimePeriods() {
    return _costumeRepository.getTimePeriods(currentInstitution!.id!);
  }

  @override
  Future<List<String>> getProductions() {
    return _costumeRepository.getProductions(currentInstitution!.id!);
  }

  @override
  void addImage(String image, String costumeId) {
    _costumeRepository.addImage(image, currentInstitution!.id!, costumeId);
  }

  @override
  Future<void> deleteImage(String costumeId, CostumeImage image) async {
    _costumeRepository.deleteImage(currentInstitution!.id!, costumeId, image);
  }
}
