import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/domain/costume/costume.dart';
import 'package:digtial_costume_platform/domain/costume/costume_query.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';

class FirebaseCostumeRepository implements ICostumeRepository {
  final _store = FirebaseFirestore.instance;

  static const String COSTUMES_COLLECTION = 'costumes';
  static const String INSTITUTIONS_COLLECTION = "institutions";

  static final _mainStorageLocations = <Location>[
    Location(id: "1", name: "Loftet"),
    Location(id: "8", name: "Den aden side")
  ];

  static final _subStorageLocations = <String, List<Location>>{
    "1": <Location>[
      Location(id: "2", name: "Lille Garderobe"),
      Location(id: "3", name: "Stor Herregarderobe"),
      Location(id: "4", name: "Laserum"),
      Location(id: "5", name: "Lille Herregarderobe"),
      Location(id: "6", name: "Stor Damegarderobe"),
      Location(id: "7", name: "Holberg Garderobe")
    ],
    "8": <Location>[
      Location(id: "9", name: "1"),
      Location(id: "10", name: "2"),
      Location(id: "11", name: "3"),
      Location(id: "12", name: "4"),
      Location(id: "13", name: "5"),
      Location(id: "14", name: "6"),
      Location(id: "15", name: "7"),
      Location(id: "16", name: "8"),
      Location(id: "17", name: "9"),
      Location(id: "18", name: "10"),
    ]
  };

  final _timePeriods = <String>["1920s", "1930s", "1940s"];

  @override
  Future<void> createCostume(String institutionId, Costume costume) async {
    _store
        .collection(INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(COSTUMES_COLLECTION)
        .add(costume.toJson());
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
  Future<Costume?> getCostume(String institutionId, String id) async {
    final snapshot = await _store
        .collection(INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(COSTUMES_COLLECTION)
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
    _store
        .collection(INSTITUTIONS_COLLECTION)
        .doc(institutionId)
        .collection(COSTUMES_COLLECTION)
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
  Future<List<String>> getCategories() {
    final _categories = <String>[
      "dresses",
      "shoes",
      "t-shirts",
      "skirts",
      "coats",
      "shirts",
      "pants",
    ];
    return Future.delayed(const Duration(seconds: 5))
        .then((value) => _categories);
  }

  @override
  Future<List<String>> getTimePeriods() {
    return Future.delayed(Duration(seconds: 3)).then((_) => _timePeriods);
  }

  @override
  Future<List<Location>> getStorageMainLocations() {
    return Future.delayed(Duration(seconds: 3))
        .then((_) => _mainStorageLocations);
  }

  @override
  Future<List<Location>?> getStorageSubLocations(String mainId) {
    return Future.delayed(Duration(seconds: 3))
        .then((_) => _subStorageLocations[mainId]);
  }
}
