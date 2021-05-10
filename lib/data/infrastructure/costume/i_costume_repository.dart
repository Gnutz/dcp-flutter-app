import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';

import '../../../domain/costume/costume.dart';

abstract class ICostumeRepository {
  Stream<List<CostumeImage>> watchCostumesImages(String institutionId, String costumeId);

  Future<List<Costume>> getCostumes(String institutionId, CostumeQuery query);

  Future<Costume?> getCostume(String institutionId, String id);

  Future<String?> createCostume(String institutionId, Costume costume);

  Future<void> updateCostume(String institutionId, Costume updated);

  Future<void> deleteCostume(String institutionId, String id);

  Future<List<String>> getCategories(String institutionId);

  Future<List<String>> getTimePeriods(String institutionId);

  Future<List<Location>> getStorageMainLocations(String institutionId);

  Future<List<Location>> getStorageSubLocations(
      String institutionId, String mainId);

  Future<List<Production>> getProductions(String institutionId);

  void addImage(String image, String institutionId, String costumeId);

  Future<void> deleteImage(
      String institutionId, String costumeId, String imageIdS);

  Future<List<String>> getColors(String institutionId);

  Future<List<String>> getThemes(String institutionId);
}