
import 'package:digtial_costume_platform/data/services/i_gallery_service.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';

class GalleryService implements IGalleryService {

  final ICostumeRepository _costumeRepository;

  GalleryService(this._costumeRepository);

  late Institution? _currentInstitution;

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
    return _costumeRepository.getCostumes(_currentInstitution!.id!, query);
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
  Future<List<String>> getCategories() async {
    try {
      return _costumeRepository.getCategories(_currentInstitution!.id!);
    } catch (e){
      return <String>[];
    }
  }

  @override
  Future<List<Location>> getStorageMainLocations() async {
    return _costumeRepository.getStorageMainLocations(_currentInstitution!.id!);
  }

  @override
  Future<List<Location>> getStorageSubLocations(String mainId) async {
    return _costumeRepository.getStorageSubLocations(
        _currentInstitution!.id!, mainId);
  }

  @override
  Future<List<String>> getTimePeriods() async {
    return _costumeRepository.getTimePeriods(_currentInstitution!.id!);
  }

  @override
  Future<List<Production>> getProductions() async {
    return _costumeRepository.getProductions(_currentInstitution!.id!);
  }

  @override
  void addImage(String image, String costumeId)  {
    _costumeRepository.addImage(image, _currentInstitution!.id!, costumeId);
  }

  @override
  Future<void> deleteImage(String costumeId, CostumeImage image) async {
    _costumeRepository.deleteImage(_currentInstitution!.id!, costumeId, image.id!);
  }

  @override
  void setInstitution(Institution institution) {
    _currentInstitution = institution;
  }

}
