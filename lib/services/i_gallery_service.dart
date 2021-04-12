import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';

abstract class IGalleryService {
  Institution? get currentInstitution;

  void setCurrentInstitution(Institution institution);

  List<CostumeCategory> get categories;

  Future<void> createCostume(Costume costume);

  Future<void> deleteCostume(String id);

  Future<Costume> getCostume(String id);

  Future<List<Costume>> getCostumes(CostumeQuery query);

  Future<void> updateCostume(Costume updated);
}
