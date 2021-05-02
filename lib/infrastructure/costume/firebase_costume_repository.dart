import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/domain/core/production.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseCostumeRepository implements ICostumeRepository {
  final FirebaseFirestore _store;
  final FirebaseStorage _storage;

  FirebaseCostumeRepository(this._store, this._storage);

  static const String _COSTUMES_COLLECTION = 'costumes';
  static const String _INSTITUTIONS_COLLECTION = "institutions";
  static const String _METADATA_COLLECTION = "metadata";
  static const String _CATEGORIES_COLLECTION = "categories";
  static const String _TIME_PERIODS_COLLECTION = "time_periods";
  static const String _STORAGE_MAINLOCATION_COLLECTION = "storages";
  static const String _STORAGE_SUBLOCATION_COLLECTION = "sublocations";
  static const String _METADATA = "metadata";
  static const String _PRODUCTIONS = "productions";
  static const String _IMAGES_COLLECTION = "images";

  /* @override
  Future<bool> deleteImageSource(String imagePath) async {
    try {
      await _storage.ref(imagePath).delete();
      return true;

    } on FirebaseException{

      return false;
    }

  } */

  @override
  Future<bool> _deleteImageSource(
      String instution, String costume, String id) async {
    try {
      var ref =
          "/$instution/$_IMAGES_COLLECTION/$_COSTUMES_COLLECTION/$costume/$id";
      print(ref);
      await _storage
          .ref(
              "/$instution/$_IMAGES_COLLECTION/$_COSTUMES_COLLECTION/$costume/$id")
          .delete();
      return true;
    } on FirebaseException {
      return false;
    }
  }

  @override
  void addImage(String image, String institutionId, String costumeId) async {
    final doc = _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(costumeId)
        .collection(_IMAGES_COLLECTION)
        .doc();

    String imagePath =
        "${institutionId}/images/costumes/${costumeId}/${doc.id}";
    await _storage.ref(imagePath).putFile(File(image));
    String downloadUrl = await _storage.ref(imagePath).getDownloadURL();

    doc.set(CostumeImage(
            downloadUrl: downloadUrl,
            uploaded: DateTime.now())
        .toJson());
  }

  @override
  Future<String?> createCostume(String institutionId, Costume costume) async {
    try {
      return (await _store
              .collection(_INSTITUTIONS_COLLECTION)
              .doc(institutionId)
              .collection(_COSTUMES_COLLECTION)
              .add(costume.toJson()))
          .id;
    } on FirebaseException {}
  }

  @override
  Future<void> deleteCostume(String institutionId, String id) async {
    final costumeDocRef = _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(id);

    //delete images
    final imagesDocCollection =
        await costumeDocRef.collection(_IMAGES_COLLECTION).get();
    await Future.forEach(
        imagesDocCollection.docs,
        (QueryDocumentSnapshot image) async =>
            await _deleteImage(institutionId, id, image.id));

    costumeDocRef.delete();
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

      final images = await _getImages(institutionId, costume.id!);
      costume.images = images;
      return costume;
    }
  }

  @override
  Future<List<Costume>> getCostumes(
      String institutionId, CostumeQuery query) async {
    final collectionRef = _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION);

    final buildQuery = queryFactoryMethod(collectionRef, query);

    final result = await buildQuery.get();

    var costumes = <Costume>[];
    result.docs.forEach((doc) {
      final costume = Costume.fromJson(doc.data())..id = doc.id;
      costumes.add(costume);
    });

    await Future.wait(costumes.map((costume) async {
      final images = await _getImages(institutionId, costume.id!);
      costume.images = images;
    }));

    return costumes;
  }

  @override
  Future<void> updateCostume(String institutionId, Costume updated) async {
    _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(updated.id)
        .set(updated.toJson());
  }

  Query queryFactoryMethod(
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

    return seedQuery;
  }

  Query createQueryForTagsSet(Query seedQuery, String key, List<String>? tags) {
    if (tags != null && tags.isNotEmpty) {
      return seedQuery.where(key, arrayContainsAny: tags);
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

  @override
  Future<List<String>> getProductions(String institutionId) async {
    List<Production> productions = [
      Production(
          id: "",
          title: "Jeg er jo lige her",
          startDate: DateTime(2021, 8, 28),
          endDate: DateTime(2021, 8, 28)),
      Production(
          id: "",
          title: "Charlie & Chokoladefarbrikken",
          startDate: DateTime(2021, 8, 28),
          endDate: DateTime(2021, 8, 28)),
      Production(
          id: "",
          title: "100 Sange",
          startDate: DateTime(2021, 8, 28),
          endDate: DateTime(2021, 8, 28)),
    ];

    return productions.map((e) => e.title ?? "").toList();
  }

  @override
  Future<List<CostumeImage>> _getImages(
      String institutionId, String costumeId) async {
    final results = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(costumeId)
        .collection(_IMAGES_COLLECTION)
        .get();

    var images = <CostumeImage>[];

    results.docs.forEach((imageDoc) {
      var image = CostumeImage.fromJson(imageDoc.data());
      image.id = imageDoc.id;
      images.add(image);
    });
    return images;
  }

  @override
  Future<bool> _deleteImage(
      String institutionId, String costumeId, String imageId) async {
    try {
      await _deleteImageSource(institutionId, costumeId, imageId);
      await _store
          .collection(_INSTITUTIONS_COLLECTION)
          .doc(institutionId)
          .collection(_COSTUMES_COLLECTION)
          .doc(costumeId)
          .collection(_IMAGES_COLLECTION)
          .doc(imageId)
          .delete();
      return true;
    } on FirebaseException {
      return false;
    }
  }

  @override
  Future<void> deleteImage(
      String institutionId, String costumeId, CostumeImage image) {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }
}

class FirebaseCostumeRepository implements ICostumeRepository {
  final FirebaseFirestore _store;
  final FirebaseStorage _storage;

  FirebaseCostumeRepository(this._store, this._storage);

  static const String _COSTUMES_COLLECTION = 'costumes';
  static const String _INSTITUTIONS_COLLECTION = "institutions";
  static const String _METADATA_COLLECTION = "metadata";
  static const String _CATEGORIES_COLLECTION = "categories";
  static const String _TIME_PERIODS_COLLECTION = "time_periods";
  static const String _STORAGE_MAINLOCATION_COLLECTION = "storages";
  static const String _STORAGE_SUBLOCATION_COLLECTION = "sublocations";
  static const String _METADATA = "metadata";
  static const String _PRODUCTIONS = "productions";
  static const String _IMAGES_COLLECTION = "images";

  /* @override
  Future<bool> deleteImageSource(String imagePath) async {
    try {
      await _storage.ref(imagePath).delete();
      return true;

    } on FirebaseException{

      return false;
    }

  } */

  @override
  Future<bool> _deleteImageSource(
      String instution, String costume, String id) async {
    try {
      var ref =
          "/$instution/$_IMAGES_COLLECTION/$_COSTUMES_COLLECTION/$costume/$id";
      print(ref);
      await _storage
          .ref(
              "/$instution/$_IMAGES_COLLECTION/$_COSTUMES_COLLECTION/$costume/$id")
          .delete();
      return true;
    } on FirebaseException {
      return false;
    }
  }

  @override
  void addImage(String image, String institutionId, String costumeId) async {
    final doc = _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(costumeId)
        .collection(_IMAGES_COLLECTION)
        .doc();

    String imagePath =
        "${institutionId}/images/costumes/${costumeId}/${doc.id}";
    await _storage.ref(imagePath).putFile(File(image));
    String downloadUrl = await _storage.ref(imagePath).getDownloadURL();

    doc.set(CostumeImage(
            downloadUrl: downloadUrl,
            uploaded: DateTime.now())
        .toJson());
  }

  @override
  Future<String?> createCostume(String institutionId, Costume costume) async {
    try {
      return (await _store
              .collection(_INSTITUTIONS_COLLECTION)
              .doc(institutionId)
              .collection(_COSTUMES_COLLECTION)
              .add(costume.toJson()))
          .id;
    } on FirebaseException {}
  }

  @override
  Future<void> deleteCostume(String institutionId, String id) async {
    final costumeDocRef = _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(id);

    //delete images
    final imagesDocCollection =
        await costumeDocRef.collection(_IMAGES_COLLECTION).get();
    await Future.forEach(
        imagesDocCollection.docs,
        (QueryDocumentSnapshot image) async =>
            await _deleteImage(institutionId, id, image.id));

    costumeDocRef.delete();
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

      final images = await _getImages(institutionId, costume.id!);
      costume.images = images;
      return costume;
    }
  }

  @override
  Future<List<Costume>> getCostumes(
      String institutionId, CostumeQuery query) async {
    final collectionRef = _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION);

    final buildQuery = queryFactoryMethod(collectionRef, query);

    final result = await buildQuery.get();

    var costumes = <Costume>[];
    result.docs.forEach((doc) {
      final costume = Costume.fromJson(doc.data())..id = doc.id;
      costumes.add(costume);
    });

    await Future.wait(costumes.map((costume) async {
      final images = await _getImages(institutionId, costume.id!);
      costume.images = images;
    }));

    return costumes;
  }

  @override
  Future<void> updateCostume(String institutionId, Costume updated) async {
    _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(updated.id)
        .set(updated.toJson());
  }

  Query queryFactoryMethod(
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

    return seedQuery;
  }

  Query createQueryForTagsSet(Query seedQuery, String key, List<String>? tags) {
    if (tags != null && tags.isNotEmpty) {
      return seedQuery.where(key, arrayContainsAny: tags);
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

  @override
  Future<List<String>> getProductions(String institutionId) async {
    List<Production> productions = [
      Production(
          id: "",
          title: "Jeg er jo lige her",
          startDate: DateTime(2021, 8, 28),
          endDate: DateTime(2021, 8, 28)),
      Production(
          id: "",
          title: "Charlie & Chokoladefarbrikken",
          startDate: DateTime(2021, 8, 28),
          endDate: DateTime(2021, 8, 28)),
      Production(
          id: "",
          title: "100 Sange",
          startDate: DateTime(2021, 8, 28),
          endDate: DateTime(2021, 8, 28)),
    ];

    return productions.map((e) => e.title ?? "").toList();
  }

  @override
  Future<List<CostumeImage>> _getImages(
      String institutionId, String costumeId) async {
    final results = await _store
        .collection(_INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(_COSTUMES_COLLECTION)
        .doc(costumeId)
        .collection(_IMAGES_COLLECTION)
        .get();

    var images = <CostumeImage>[];

    results.docs.forEach((imageDoc) {
      var image = CostumeImage.fromJson(imageDoc.data());
      image.id = imageDoc.id;
      images.add(image);
    });
    return images;
  }

  @override
  Future<bool> _deleteImage(
      String institutionId, String costumeId, String imageId) async {
    try {
      await _deleteImageSource(institutionId, costumeId, imageId);
      await _store
          .collection(_INSTITUTIONS_COLLECTION)
          .doc(institutionId)
          .collection(_COSTUMES_COLLECTION)
          .doc(costumeId)
          .collection(_IMAGES_COLLECTION)
          .doc(imageId)
          .delete();
      return true;
    } on FirebaseException {
      return false;
    }
  }

  @override
  Future<void> deleteImage(
      String institutionId, String costumeId, CostumeImage image) {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }
}
