import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';

class FirebaseCostumeRepository implements ICostumeRepository {
  final _store = FirebaseFirestore.instance;

  static const String _COSTUMES_COLLECTION = 'costumes';
  static const String _INSTITUTIONS_COLLECTION = "institutions";
  static const String _METADATA_COLLECTION = "metadata";
  static const String _CATEGORIES_COLLECTION = "categories";
  static const String _TIME_PERIODS_COLLECTION = "time_periods";
  static const String _STORAGE_MAINLOCATION_COLLECTION = "storages";
  static const String _STORAGE_SUBLOCATION_COLLECTION = "sublocations";
  static const String _METADATA = "metadata";

  @override
  Future<void> createCostume(String institutionId, Costume costume) async {
    _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .add(costume.toJson());
  }

  @override
  Future<void> deleteCostume(String institutionId, String id) async {
    await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(id)
        .delete();

    //TODO: DELETE ALL IMAGES and productions
  }

  @override
  Future<Costume?> getCostume(String institutionId, String id) async {
    final snapshot = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(id)
        .get();

    final json = snapshot.data();
    if (json != null) {
      final costume = Costume.fromJson(json);
      costume.id = id;
      return costume;
    }
  }

  @override
  Future<List<Costume>> getCostumes(String institutionId, CostumeQuery query) async {
    final collectionRef = _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION);

    final buildQuery = queryFactoryMethod(collectionRef, query);

    final results = await buildQuery.get();

    return <Costume>[];
    //TODO: foreach
  }

  @override
  Future<void> updateCostume(String institutionId, Costume updated) async {
    _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(updated.id)
        .update(updated.toJson());
  }

  Query queryFactoryMethod(CollectionReference collectionReference,
      CostumeQuery query) {
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

    return seedQuery;
  }

  @override
  Future<List<String>> getCategories(String institutionId) async {
    const CATEGORY_KEY = "category";
    final result = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_METADATA_COLLECTION)
        .doc("metadata")
        .collection(_CATEGORIES_COLLECTION)
        .orderBy(CATEGORY_KEY)
        .get();
    var categories = <String>[];
    result.docs.forEach((doc) => categories.add(doc[CATEGORY_KEY] as String));

    return categories;
  }

  @override
  Future<List<String>> getTimePeriods(String institutionId) async {
    const TIME_KEY = "time";

    final result = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_METADATA_COLLECTION)
        .doc(_METADATA)
        .collection(_TIME_PERIODS_COLLECTION)
        .orderBy(TIME_KEY)
        .get();

    var timePeriods = <String>[];

    result.docs.forEach((doc) => timePeriods.add(doc[TIME_KEY] as String));
    return timePeriods;
  }

  @override
  Future<List<Location>> getStorageMainLocations(String institutionId) async {
    final result = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_STORAGE_MAINLOCATION_COLLECTION)
        .orderBy("location")
        .get();

    var mainLocations = <Location>[];

    result.docs.forEach((locationDoc) {
      var location = Location.fromJson(locationDoc.data());
      location.id = locationDoc.id;
      mainLocations.add(location);
    });

    return mainLocations;
  }

  @override
  Future<List<Location>> getStorageSubLocations(
      String institutionId, String mainId) async {
    final result = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_STORAGE_MAINLOCATION_COLLECTION)
        .doc(mainId)
        .collection(_STORAGE_SUBLOCATION_COLLECTION)
        .orderBy("location")
        .get();

    var subLocations = <Location>[];

    result.docs.forEach((locationDoc) {
      var location = Location.fromJson(locationDoc.data());
      location.id = locationDoc.id;
      subLocations.add(location);
    });
    return subLocations;
  }
}
