
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:digtial_costume_platform/infrastructure/costume/firebase_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';

import 'firebase_costume_repository.mocks.dart';

@GenerateMocks([FirebaseFirestore, FirebaseStorage, DocumentReference, Reference])
main(){

  late MockFirebaseFirestore mockStore;
  late MockFirebaseStorage mockStorage;
  late FirebaseCostumeRepository repo;

  setUp(() {

    mockStore = MockFirebaseFirestore();
    mockStorage = MockFirebaseStorage();
    repo = FirebaseCostumeRepository(mockStore, mockStorage);
  });

    test("setting the status to something else than InStorage should also set stotageLocation to null", () async
    {
      //arrange

      final mockImageDocRef = MockDocumentReference();
      final mockStorageRef = MockReference();
      const imagePath = "/data/user/0/kga.digtial_costume_platform/cache/image_picker7961270983189305822.jpg";
      const institutionId = "3wjLzZ6VjYIJRV64hSLh";
      const costumeId = "9JDwbdTL5yUqpwiJrhAP";
      const expectedImageRefId = 'mmQ5e13pfk4sbrqXHeBh';
      const expectedDownloadUrl = "https://firebasestorage.googleapis.com/v0/b/theater-resource-platform.appspot.com/o/eDDNM6LeSWVzj52ThQtO%2Fimages%2Fcostumes%2FjuhrvCR0tiEjZ5fDdrJO%2FmmQ5e13pfk4sbrqXHeBh?alt=media&token=a9f5d1a9-54b9-4d33-95a4-fc5d8bf38153";

    final mockDate = DateTime.now();


      when(mockStore.collection("institution")
          .doc(costumeId)
          .collection("costumes")
          .doc(costumeId)).thenReturn(mockImageDocRef);
      when(mockImageDocRef.id).thenReturn(expectedImageRefId);
      when(mockStorage.ref("$institutionId/images/costumes/$costumeId/$expectedImageRefId")
          .getDownloadURL()).thenAnswer((_) async => expectedDownloadUrl);


      final response = CostumeImage(
          id: 'mmQ5e13pfk4sbrqXHeBh',
          downloadUrl: "https://firebasestorage.googleapis.com/v0/b/theater-resource-platform.appspot.com/o/eDDNM6LeSWVzj52ThQtO%2Fimages%2Fcostumes%2FjuhrvCR0tiEjZ5fDdrJO%2FmmQ5e13pfk4sbrqXHeBh?alt=media&token=a9f5d1a9-54b9-4d33-95a4-fc5d8bf38153",
          uploaded: mockDate);

      //act
      repo.addImage(imagePath, institutionId, costumeId);

      //assert
      verifyInOrder([
        mockStore.collection("institutions").doc(institutionId).collection(
            "costumes").doc(costumeId).collection("images")
            .doc(),
        mockStorage.ref(
            "$institutionId/images/costumes/$costumeId/mmQ5e13pfk4sbrqXHeBh")
            .putFile(File(imagePath)),
       mockStore.collection("institutions").doc(institutionId).collection(
            "costumes").doc(costumeId).collection("images")
            .doc("images").set(response.toJson())
      ]);
    });
}
