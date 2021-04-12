import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';

class FirebaseCostumeRepository implements ICostumeRepository {
  final _store = FirebaseFirestore.instance;

  static const String COSTUMES_COLLECTION = 'costumes';
  static const String INSTITUTIONS_COLLECTION = "institutions";

  @override
  Future<void> createCostume(String institutionId, Costume costume) async {
    await _store.collection(INSTITUTIONS_COLLECTION).doc(institutionId);
    // .collection(COSTUMES_COLLECTION).add(costume.toJson());
  }

  @override
  Future<void> deleteCostume(String institutionId, String id) async {
    await _store
        .collection(INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(COSTUMES_COLLECTION)
        .doc(id)
        .delete();

    //TODO: DELETE ALL IMAGES and productions
  }

  @override
  Future<Costume> getCostume(String institutionId, String id) async {
    final snapshot = await _store
        .collection(INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(COSTUMES_COLLECTION)
        .doc(id)
        .get();

    return Costume();

    /* final json = snapshot.data();
    if(json != null) {
      return Costume.fromJson(json);
    }
    return null; */
  }

  @override
  Future<List<Costume>> getCostumes(
      String institutionId, CostumeQuery query) async {
    final collectionRef = _store
        .collection(INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(COSTUMES_COLLECTION);

    final buildQuery = queryFactoryMethod(collectionRef, query);

    final results = await buildQuery.get();

    return <Costume>[];
    //TODO: foreach
  }

  @override
  Future<void> updateCostume(String institutionId, Costume updated) async {
    await _store.collection(INSTITUTIONS_COLLECTION).doc(institutionId);
    // .collection(COSTUMES_COLLECTION).doc(updated.id).update(costume.toJson());
  }

  queryFactoryMethod(
      CollectionReference collectionReference, CostumeQuery query) {
    const PRODUCTION_KEY = "production";
    const CATEGORY_KEY = "category";
    const FASHION_KEY = "fashion";
    const COLORS_KEY = "colors";
    const THEMES_KEY = "themes";

    Query seedQuery = collectionReference;

    if (query.production != null) {
      seedQuery = seedQuery.where(PRODUCTION_KEY, isEqualTo: query.production);
    }

    if (query.category != null) {
      seedQuery = seedQuery.where(CATEGORY_KEY, isEqualTo: query.category);
    }

    if (query.fashion != null) {
      seedQuery = seedQuery.where(FASHION_KEY, isEqualTo: query.fashion);
    }

    if (query.colors != null) {
      seedQuery = seedQuery.where(COLORS_KEY, arrayContains: query.colors);
    }

    if (query.themes != null) {
      seedQuery = seedQuery.where(THEMES_KEY, arrayContains: query.themes);
    }
  }
}
