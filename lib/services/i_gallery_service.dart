import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';

abstract class IGalleryService {
  Institution? get currentInstitution;

  void setCurrentInstitution(Institution institution);

  Future<void> createCostume(Costume costume);

  Future<void> deleteCostume(String id);

  Future<Costume?> getCostume(String id);

  Future<List<Costume>> getCostumes(CostumeQuery query);

  Future<void> updateCostume(Costume updated);

  Future<Costume?> checkOut(Costume costume, Production production);

  Future<List<String>> getCategories();

  Future<List<String>> getTimePeriods();

  Future<List<Location>> getStorageMainLocations();

  Future<List<Location>> getStorageSubLocations(String mainId);
}