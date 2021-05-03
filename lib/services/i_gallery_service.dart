
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';

abstract class IGalleryService {

  Future<String?> createCostume(Costume costume);

  Future<void> deleteCostume(String id);

  Future<Costume?> getCostume(String id);

  Future<List<Costume>> getCostumes(CostumeQuery query);

  Future<void> updateCostume(Costume updated);

  Future<Costume?> checkOut(Costume costume, Production production);

  Future<List<String>> getCategories();

  Future<List<String>> getTimePeriods();

  Future<List<Location>> getStorageMainLocations();

  Future<List<Location>> getStorageSubLocations(String mainId);

  Future<List<String>> getProductions();

  void addImage(String image, String costumeId);

  Future<void> deleteImage(String costumeId, CostumeImage image);

  void setInstitution(Institution institution);
}