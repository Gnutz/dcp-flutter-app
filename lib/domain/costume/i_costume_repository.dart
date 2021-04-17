import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/status.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';

import 'costume.dart';

abstract class ICostumeRepository {
  Future<List<Costume>> getCostumes(String instituionId, CostumeQuery query);

  Future<Costume> getCostume(String instituionId, String id);

  Future<void> createCostume(String instituionId, Costume costume);

  Future<void> updateCostume(String instituionId, Costume updated);

  Future<void> deleteCostume(String instituionId, String id);

  Future<List<CostumeCategory>> getCategories();

  Future<List<String>> getTimePeriods();

  Future<List<Location>> getStorageMainLocations();

  Future<List<Location>> getStorageSubLocations(String mainId);


//FutuaddImage(image, costume);

//addAProduction

//checkOut(production, id);
//_setStatus()

}
