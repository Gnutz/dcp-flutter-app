import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:digtial_costume_platform/infrastructure/costume/firebase_costume_repository.dart';
import 'package:digtial_costume_platform/domain/costume/costume_image.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}
class MockStorage extends Mock implements FirebaseStorage {}
class MockDocumentReference extends Mock implements DocumentReference {}
class MockFile extends Mock implements File {};

main() {


  test("setting the status to something else than InStorage should also set stotageLocation to null", () {
    //arrange
    final mockStore = MockFirestore();
    final mockStorage = MockStorage();
    final mockRef = MockDocumentReference();
    when(mockRef.id).thenReturn('mmQ5e13pfk4sbrqXHeBh');
    final repo = FirebaseCostumeRepository(mockStore, mockStorage);

    final imagePath = "";
    final institutionId = "3wjLzZ6VjYIJRV64hSLh";
    final costumeId = "9JDwbdTL5yUqpwiJrhAP";





    when(mockStore.collection("institutions").doc(institutionId).collection("costumes").doc(costumeId).collection("images")
        .doc()).thenAnswer((realInvocation) => mockRef);



    final mockDate = DateTime.now();
    final response = CostumeImage(
        id: 'mmQ5e13pfk4sbrqXHeBh',
        downloadUrl: "https://firebasestorage.googleapis.com/v0/b/theater-resource-platform.appspot.com/o/eDDNM6LeSWVzj52ThQtO%2Fimages%2Fcostumes%2FjuhrvCR0tiEjZ5fDdrJO%2FmmQ5e13pfk4sbrqXHeBh?alt=media&token=a9f5d1a9-54b9-4d33-95a4-fc5d8bf38153",
        uploaded: mockDate);

    final CostumeId()


        final expectedStatus = InUse(
            inUseFor: Production(
                title: "Charlie and the Chocolate Factory",
                startDate: mockTime,
                endDate: mockTime));

        //act
        repo.addImage(imagePath,institutionId, costumeId);


        //assert
        verifyInOrder([
          mockStore.collection("institutions").doc(institutionId).collection("costumes").doc(costumeId).collection("images")
          .doc(),
          mockStorage.ref("${institutionId}/images/costumes/${costumeId}/mmQ5e13pfk4sbrqXHeBh").putFile(MockFile(mmQ5e13pfk4sbrqXHeBh)))
    ];

        ]
          mockStorage
    ]);
      });

}
