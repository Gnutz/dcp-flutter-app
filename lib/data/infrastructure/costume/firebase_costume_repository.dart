import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/fashion.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseCostumeRepository implements ICostumeRepository {
  final FirebaseFirestore _store;
  final FirebaseStorage _storage;

  FirebaseCostumeRepository(this._store, this._storage);

  static const _COSTUMES_COLLECTION = 'costumes';
  // ignore: constant_identifier_names
  static const _INSTITUTIONS_COLLECTION = "institutions";
  // ignore: constant_identifier_names
  static const _METADATA_COLLECTION = "metadata";
  // ignore: constant_identifier_names
  static const _CATEGORIES_COLLECTION = "categories";
  // ignore: constant_identifier_names
  static const _TIME_PERIODS_COLLECTION = "time_periods";
  // ignore: constant_identifier_names
  static const _STORAGE_MAINLOCATION_COLLECTION = "storages";
  // ignore: constant_identifier_names
  static const _STORAGE_SUBLOCATION_COLLECTION = "sublocations";
  // ignore: constant_identifier_names
  static const _METADATA = "metadata";
  // ignore: constant_identifier_names
  static const _PRODUCTIONS = "productions";
  // ignore: constant_identifier_names
  static const _CURRENT_PRODUCTIONS = "current";
  // ignore: constant_identifier_names
  static const _IMAGES_COLLECTION = "images";

  Future<bool> _deleteImageSource(
      String institution, String costume, String id) async {
    try {
      await _storage
          .ref(
              "/$institution/$_IMAGES_COLLECTION/$_COSTUMES_COLLECTION/$costume/$id")
          .delete();
      return true;
    } on FirebaseException {
      return false;
    }
  }

  @override
  void addImage(String image, String institutionId, String costumeId) async {
    final doc = _costumeReferenceFactory(institutionId, costumeId)
        .collection(_IMAGES_COLLECTION)
        .doc();

    final String imagePath =
        "$institutionId/images/costumes/$costumeId/${doc.id}";
    await _storage.ref(imagePath).putFile(File(image));
    final String downloadUrl = await _storage.ref(imagePath).getDownloadURL();

    doc.set(CostumeImage(
            downloadUrl: downloadUrl,
            uploaded: DateTime.now())
        .toJson());
  }

  @override
  Future<String?> createCostume(String institutionId, Costume costume) async {
    return (await _store
              .collection(_INSTITUTIONS_COLLECTION)
              .doc(institutionId)
              .collection(_COSTUMES_COLLECTION)
              .add(costume.toJson()))
          .id;
  }

  @override
  Future<void> deleteCostume(String institutionId, String id) async {
    final costumeDocRef = _costumeReferenceFactory(institutionId, id);

    //delete images
    final imagesDocCollection =
        await costumeDocRef.collection(_IMAGES_COLLECTION).get();
    await Future.forEach(
        imagesDocCollection.docs,
        (QueryDocumentSnapshot image) async => deleteImage(institutionId, id, image.id));

    costumeDocRef.delete();
  }

  DocumentReference _costumeReferenceFactory(String institutionId, String id) {
    return _store
      .collection(_INSTITUTIONS_COLLECTION)
      .doc(institutionId)
      .collection(_COSTUMES_COLLECTION)
      .doc(id);
  }

  @override
  Future<Costume?> getCostume(String institutionId, String id) async {
    final snapshot = await _costumeReferenceFactory(institutionId, id)
        .get();

    final json = snapshot.data();
    if (json != null) {
      final costume = Costume.fromJson(json);
      costume.id = id;

      final images = await _getImages(institutionId, costume.id!);
      costume.images = images;
      return costume;
    }
  }

  @override
  Future<List<Costume>> getCostumes(String institutionId, CostumeQuery query) async {
    final collectionRef = _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION);

    Query firebaseQuery = baseQueryBuilder(collectionRef, query);

   /* final anyThemeTerms = query.themes == null || query.themes!.isNotEmpty;
    final anyColorTerms = query.colors == null || query.colors!.isNotEmpty;

    if(!anyThemeTerms && !anyColorTerms){
      final costumes = await _getCostumes(baseQuery);

      await Future.wait(costumes.map((costume) async {
        final images = await _getImages(institutionId, costume.id!);
        costume.images = images;
      }));

      return costumes;
    }

    List<Costume>? resultsFromColorSet;
    if(query.colors != null && query.colors!.isNotEmpty) {
      resultsFromColorSet = await _performQueryForTagsSet(baseQuery, COLORS_KEY, query.colors);
    }

    List<Costume>? resultsFromThemesSet;
    if(query.themes != null && query.themes!.isNotEmpty) {
      resultsFromThemesSet = await _performQueryForTagsSet(baseQuery, THEMES_KEY, query.themes);
    }

    late List<Costume> costumes;
    if(resultsFromThemesSet != null && resultsFromColorSet != null){
      costumes = resultsFromThemesSet.where((costume) => resultsFromColorSet!.contains(costume)
      ).toList();
    }
    else{
      costumes = (resultsFromThemesSet ?? resultsFromColorSet)!;
    } */

    final costumes = await _getCostumes(firebaseQuery);

    await Future.wait(costumes.map((costume) async {
      final images = await _getImages(institutionId, costume.id!);
      costume.images = images;
    }));

    return costumes;
  }

  @override
  Future<void> updateCostume(String institutionId, Costume updated) async {
    _costumeReferenceFactory(institutionId, updated.id!)
        .set(updated.toJson());
  }

  Query baseQueryBuilder(
      CollectionReference collectionReference, CostumeQuery query) {
    // ignore: constant_identifier_names
    const PRODUCTIONS_KEY = "productions";
    // ignore: constant_identifier_names
    const CATEGORY_KEY = "category";
    // ignore: constant_identifier_names
    const FASHION_KEY = "fashion";
    const COLORS_KEY = "colors";
    const THEMES_KEY = "themes";


    Query seedQuery = collectionReference;

    if (query.production != null) {
      seedQuery = seedQuery.where(PRODUCTIONS_KEY, arrayContains: query.production);
    }

    if (query.category != null) {
      seedQuery = seedQuery.where(CATEGORY_KEY, isEqualTo: query.category);
    }

    if (query.fashion != null) {
      seedQuery = seedQuery.where(FASHION_KEY,
          isEqualTo: FashionEnumToStringMapper.fashionToString(query.fashion!));
    }

    if (query.themes != null ) {
      query.themes!.forEach((theme) {
        seedQuery = seedQuery.where('$THEMES_KEY.$theme', isEqualTo: true);
      });
    }

      if (query.colors != null ) {
        query.colors!.forEach((color) {
          seedQuery = seedQuery.where('$COLORS_KEY.$color',isEqualTo: true);
        });
      }
        return seedQuery;
  }

  Future<List<Costume>> _getCostumes(Query query) async {
    final results = await query.get();
    final costumes = <Costume>[];

    results.docs.forEach((doc) => costumes.add(Costume.fromJson(doc.data())..id = doc.id));
    return costumes;
  }

  @override
  Future<List<String>> getCategories(String institutionId) async {
    const CATEGORY_KEY = "category";
    final result = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_METADATA_COLLECTION)
        .doc(_METADATA)
        .collection(_CATEGORIES_COLLECTION)
        .orderBy(CATEGORY_KEY)
        .get();
    final categories = <String>[];
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

    final timePeriods = <String>[];

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

    final mainLocations = <Location>[];

    result.docs.forEach((locationDoc) {
      final location = Location.fromJson(locationDoc.data());
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

    final subLocations = <Location>[];

    result.docs.forEach((locationDoc) {
      final location = Location.fromJson(locationDoc.data());
      location.id = locationDoc.id;
      subLocations.add(location);
    });
    return subLocations;
  }

  @override
  Future<List<Production>> getProductions(String institutionId) async {
    final result = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_PRODUCTIONS)
        .doc(_PRODUCTIONS)
        .collection(_CURRENT_PRODUCTIONS)
        .orderBy("title")
        .get();

    final productions = <Production>[];

    result.docs.forEach((doc) {
      final production = Production.fromJson(doc.data())..id = doc.id;
      productions.add(production);
    });

    return productions;

  }

  Future<List<CostumeImage>> _getImages(
      String institutionId, String costumeId) async {
    final results = await _costumeReferenceFactory(institutionId, costumeId)
        .collection(_IMAGES_COLLECTION)
        .get();

    final images = <CostumeImage>[];

    results.docs.forEach((imageDoc) {
      final image = CostumeImage.fromJson(imageDoc.data());
      image.id = imageDoc.id;
      images.add(image);
    });
    return images;
  }

  @override
  Future<void> deleteImage(
      String institutionId, String costumeId, String imageId) async {
    try {
      await _deleteImageSource(institutionId, costumeId, imageId);
      await _costumeReferenceFactory(institutionId, costumeId)
          .collection(_IMAGES_COLLECTION)
          .doc(imageId)
          .delete();
    } on FirebaseException {
    }
  }


}