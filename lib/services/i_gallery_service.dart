import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:digtial_costume_platform/domain/gallery/costume_category.dart';

abstract class IGalleryService {
  Institution? get currentInstitution;
  void setCurrentInstitution(Institution institution);
  List<CostumeCategory> get categories;
}
