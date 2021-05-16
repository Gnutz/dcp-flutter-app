import 'package:digtial_costume_platform/bloc/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/data/infrastructure/auth/firebase_auth_repository.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_bloc_test.mocks.dart';


@GenerateMocks([FirebaseAuthRepository])
main() {

  late MockFirebaseAuthRepository mockAuthService;
  late RegisterBloc unitUnderTest;
  final mockedInstitutions = <Institution>[
    Institution(
        name: "Aarhus Teater", alias: "AT", id: "f3OS9VsFmNX6iZUH9SRs"),
    Institution(name: "Det Konglelige Teater", id: "A7XwwAtuG5Uoali3F038")
  ];

  setUp((){
    mockAuthService = MockFirebaseAuthRepository();
    unitUnderTest = RegisterBloc(mockAuthService);

  });

   test("RegisterBloc returns initial form then form with options at creation", () async {

     // arrange
     final institutionsLoaded = RegisterState.initial().copyWith(institutions: mockedInstitutions);
     when(mockAuthService.getInstitutions()).thenAnswer((_)  async => mockedInstitutions);
      //assert inital state
      expect(unitUnderTest.state, equals(RegisterState.initial()));

      //assert that form with institution options are loaded
      await expectLater(
          unitUnderTest.stream,
          emits(institutionsLoaded)
          );

      //assert that only one call to repository made
      verify(mockAuthService.getInstitutions()).called(1);
      verifyNoMoreInteractions(mockAuthService);
    });

   test("Registerbloc return updated form without calling authService when form is updated with name", () async {
     //arrange
     const expectedName = "John Doe";
     when(mockAuthService.getInstitutions()).thenAnswer((
         _) async => []);

     //act - instantiation
     unitUnderTest.add(RegisterEvent.nameChanged(expectedName));

     //assert inital state
     expect(unitUnderTest.state, equals(RegisterState.initial()));

     //assert that form with institution options are loaded
     await expectLater(
         unitUnderTest.stream,
         emits(
           //state returned after
         RegisterState.initial()
             .copyWith(name: expectedName)
         )
     );

     //assert that only one call to repository made
     verify(mockAuthService.getInstitutions()).called(1);
     verifyNoMoreInteractions(mockAuthService);
   });



  //email valid

  // email invalid

  //password

  // password invalid

  //confirmedPassword

  //institution

  //role

  //submit

  //userAgreement

  //signUp

  //if creator creates a Request

}
