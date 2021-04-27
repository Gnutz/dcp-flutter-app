import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';

class GalleryService implements IGalleryService {
  Institution? _currentInstitution =
      Institution(name: "aarhus Teater", uid: "fHEEOUrR8ZcsqbH19dzC");
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
    return _costumeRepository.getCostumes(currentInstitution!.uid!, query);
  }

  @override
  Future<void> updateCostume(Costume updated) async {
    _costumeRepository.updateCostume(_currentInstitution!.uid!, updated);
  }

  @override
  Future<Costume?> checkOut(Costume costume, Production production) {
    costume.storageLocation = null;
    costume.status = InUse(inUseFor: production);
    updateCostume(costume);
    return getCostume(costume.id!);
  }

  @override
  Future<List<String>> getCategories() {
    return _costumeRepository.getCategories(currentInstitution!.uid!);
  }

  @override
  Future<List<Location>> getStorageMainLocations() {
    return _costumeRepository.getStorageMainLocations(currentInstitution!.uid!);
  }

  @override
  Future<List<Location>> getStorageSubLocations(String mainId) {
    return _costumeRepository.getStorageSubLocations(
        currentInstitution!.uid!, mainId);
  }

  @override
  Future<List<String>> getTimePeriods() {
    return _costumeRepository.getTimePeriods(currentInstitution!.uid!);
  }

  @override
  Future<List<String>> getProductions() {
    return _costumeRepository.getProductions(currentInstitution!.uid!);
  }
}
