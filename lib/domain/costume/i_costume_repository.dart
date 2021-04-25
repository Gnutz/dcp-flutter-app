import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';

import 'costume.dart';

abstract class ICostumeRepository {
  Future<List<Costume>> getCostumes(String institutionId, CostumeQuery query);

  Future<Costume?> getCostume(String institutionId, String id);

  Future<void> createCostume(String institutionId, Costume costume);

  Future<void> updateCostume(String institutionId, Costume updated);

  Future<void> deleteCostume(String institutionId, String id);

  Future<List<String>> getCategories(String institutionId);

  Future<List<String>> getTimePeriods(String institutionId);

  Future<List<Location>> getStorageMainLocations(String institutionId);

  Future<List<Location>> getStorageSubLocations(
      String institutionId, String mainId);

//FutuaddImage(image, costume);

//addAProduction

//checkOut(production, id);
//_setStatus()

}
