import 'package:bloc_test/bloc_test.dart';
import 'package:digtial_costume_platform/bloc/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/data/infrastructure/auth/firebase_auth_repository.dart';
import 'package:digtial_costume_platform/domain/auth/auth_failures.dart';
import 'package:digtial_costume_platform/domain/auth/user.dart';
import 'package:digtial_costume_platform/domain/core/institution.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthRepository extends Mock implements FirebaseAuthRepository{}

main() {

  late MockFirebaseAuthRepository mockAuthService;
  late RegisterBloc unitUnderTest;
  final mockedInstitutions = <Institution>[
    Institution(
        name: "Aarhus Teater", alias: "AT", id: "f3OS9VsFmNX6iZUH9SRs"),
    Institution(name: "Det Konglelige Teater", id: "A7XwwAtuG5Uoali3F038")
  ];
  
  final validState = RegisterState.initial().copyWith(
    name: "John Doe",
    emailAddress: "johndoe@test.com",
    password: "Password123*",
    userAgreementAccepted: true,
    role: UserRole.creator,
    institution: mockedInstitutions[0],
  );
  
  setUp((){
    registerFallbackValue(UserRole.creative);
    registerFallbackValue(mockedInstitutions[0]);
    mockAuthService = MockFirebaseAuthRepository();
    unitUnderTest = RegisterBloc(mockAuthService);
  });

   test("RegisterBloc returns initial form then form with options at creation", () async {

     // arrange
     final institutionsLoaded = RegisterState.initial().copyWith(institutions: mockedInstitutions);
     when(() => mockAuthService.getInstitutions()).thenAnswer((_)  async => mockedInstitutions);
      //assert inital state
      expect(unitUnderTest.state, equals(RegisterState.initial()));

      //assert that form with institution options are loaded
      await expectLater(
          unitUnderTest.stream,
          emits(institutionsLoaded)
          );

      //assert that only one call to repository made
      verify(() => mockAuthService.getInstitutions()).called(1);
      verifyNoMoreInteractions(mockAuthService);
    });

   test("Registerbloc return updated form without calling authService when form is updated with name", () async {
     //arrange
     const expectedName = "John Doe";
     when(() => mockAuthService.getInstitutions()).thenAnswer((
         _) async => []);

     //act
     unitUnderTest.add(const RegisterEvent.nameChanged(expectedName));

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
     verify(() => mockAuthService.getInstitutions()).called(1);
     verifyNoMoreInteractions(mockAuthService);
   });

  //email
  test("Registerbloc return updated form without calling authService when form is updated with email", () async {
    //arrange
    const expectedEmail = "johndoe@test.com";
    when(() => mockAuthService.getInstitutions()).thenAnswer((
        _) async => []);

    //act
    unitUnderTest.add(const RegisterEvent.emailChanged(expectedEmail));

    //assert inital state
    expect(unitUnderTest.state, equals(RegisterState.initial()));

    //assert that form with institution options are loaded
    await expectLater(
        unitUnderTest.stream,
        emits(
          //state returned after
            RegisterState.initial()
                .copyWith(emailAddress: expectedEmail)
        )
    );

    //assert that only one call to repository made
    verify(() => mockAuthService.getInstitutions()).called(1);
    verifyNoMoreInteractions(mockAuthService);
  });

  // email invalid

  //password
  test("Registerbloc return updated form without calling authService when form is updated with password", () async {
    //arrange
    const expectedPassword = "Password123*";
    when(() => mockAuthService.getInstitutions()).thenAnswer((
        _) async => []);

    //act
    unitUnderTest.add(const RegisterEvent.passwordChanged(expectedPassword));

    //assert inital state
    expect(unitUnderTest.state, equals(RegisterState.initial()));

    //assert that form with institution options are loaded
    await expectLater(
        unitUnderTest.stream,
        emits(
          //state returned after
            RegisterState.initial()
                .copyWith(password: expectedPassword)
        )
    );

    //assert that only one call to repository made
    verify(() => mockAuthService.getInstitutions()).called(1);
    verifyNoMoreInteractions(mockAuthService);
  });


  // password invalid

  //password confirmation
  test("Registerbloc return updated form without calling authService when form is updated with password confirmation", () async {
    //arrange
    const expectedPassword = "Password123*";
    when(() => mockAuthService.getInstitutions()).thenAnswer((
        _) async => []);

    //act
    unitUnderTest.add(const RegisterEvent.passwordConfirmed(expectedPassword));

    //assert inital state
    expect(unitUnderTest.state, equals(RegisterState.initial()));

    //assert that form with institution options are loaded
    await expectLater(
        unitUnderTest.stream,
        emits(
          //state returned after
            RegisterState.initial()
                .copyWith(passwordConfirmation: expectedPassword)
        )
    );

    //assert that only one call to repository made
    verify(() => mockAuthService.getInstitutions()).called(1);
    verifyNoMoreInteractions(mockAuthService);
  });

  //institution
  test("Registerbloc return updated form without calling authService when form is updated with selected institution", () async {
    //arrange
    final expectedInstitution = mockedInstitutions[0];
    when(() => mockAuthService.getInstitutions()).thenAnswer((
        _) async => []);

    //act
    unitUnderTest.add(RegisterEvent.institutionSelected(expectedInstitution));

    //assert inital state
    expect(unitUnderTest.state, equals(RegisterState.initial()));

    //assert that form with institution options are loaded
    await expectLater(
        unitUnderTest.stream,
        emits(
          //state returned after
            RegisterState.initial()
                .copyWith(institution: expectedInstitution)
        )
    );

    //assert that only one call to repository made
    verify(() => mockAuthService.getInstitutions()).called(1);
    verifyNoMoreInteractions(mockAuthService);
  });

  //userAgreement
  test("Registerbloc return updated form without calling authService when form is updated with userAgreementAccepted", () async {
    //arrange
    when(() => mockAuthService.getInstitutions()).thenAnswer((
        _) async => []);

    //act
    unitUnderTest.add(RegisterEvent.userAgreementAcceptToggle());

    //assert inital state
    expect(unitUnderTest.state, equals(RegisterState.initial()));

    //assert that form with institution options are loaded
    await expectLater(
        unitUnderTest.stream,
        emits(
          //state returned after
            RegisterState.initial()
                .copyWith(userAgreementAccepted: true)
        )
    );

    //assert that only one call to repository made
    verify(() => mockAuthService.getInstitutions()).called(1);
    verifyNoMoreInteractions(mockAuthService);
  });

  //role
  test("Registerbloc return updated form without calling authService when form is updated with a new role", () async {
    //arrange
    const expectedRole = UserRole.creator;
    when(() => mockAuthService.getInstitutions()).thenAnswer((
        _) async => []);

    //act - instantiation
    unitUnderTest.add(RegisterEvent.roleSelected(expectedRole));

    //assert inital state
    expect(unitUnderTest.state, equals(RegisterState.initial()));

    //assert that form with institution options are loaded
    await expectLater(
        unitUnderTest.stream,
        emits(
          //state returned after
            RegisterState.initial()
                .copyWith(role: expectedRole)
        )
    );

    //assert that only one call to repository made
    verify(() => mockAuthService.getInstitutions()).called(1);
    verifyNoMoreInteractions(mockAuthService);
  });


  //submit
 /* test("Registerbloc return no new state if email is not valid", () async {
    //arrange
    const invalidEmail = "JohnDoe_com"; //example of invalid email
    when(mockAuthService.getInstitutions()).thenAnswer((
        _) async => []);
    
    

    //act - instantiation
    unitUnderTest.add(RegisterEvent.registerWithFormFilledPressed());

    //assert inital state
    expect(unitUnderTest.state, equals(RegisterState.initial()));

    //assert that only one call to repository made
    verify(mockAuthService.getInstitutions()).called(1);
    verifyNoMoreInteractions(mockAuthService);
  }); */
  
  blocTest("Registerbloc return no new state if email is not valid",
      build: () {
        when(() => mockAuthService.getInstitutions()).thenAnswer((
          _) async => []);
        return unitUnderTest;
      },
      seed: () => validState.copyWith(emailAddress: "JohnDoe_com"),
      act: (_) => unitUnderTest.add(RegisterEvent.registerWithFormFilledPressed()),
      verify: (_) {
        verify(() => mockAuthService.getInstitutions()).called(1);
        verifyNoMoreInteractions(mockAuthService);
      }
  );

  blocTest("Registerbloc return no new state if password is not valid",
      build: () {
        when(() => mockAuthService.getInstitutions()).thenAnswer((
            _) async => []);
        return unitUnderTest;
      },
      seed: () => validState.copyWith(password: "password"),
      act: (_) => unitUnderTest.add(RegisterEvent.registerWithFormFilledPressed()),
      verify: (_) {
        verify( () => mockAuthService.getInstitutions()).called(1);
        verifyNoMoreInteractions(mockAuthService);
      }
  );

  blocTest("Registerbloc return no new state if institution not selected",
      build: () {
        when(() => mockAuthService.getInstitutions()).thenAnswer((
            _) async => []);
        return unitUnderTest;
      },
      seed: () => validState.copyWith(institution: null),
      act: (_) => unitUnderTest.add(RegisterEvent.registerWithFormFilledPressed()),
      verify: (_) {
        verify(() => mockAuthService.getInstitutions()).called(1);
        verifyNoMoreInteractions(mockAuthService);
      }
  );

  blocTest("Registerbloc returns form with authFailure if failing register",
      build: () {
        when(() => mockAuthService.getInstitutions()).thenAnswer((
            _) async => []);
        when(() => mockAuthService.registerUser(name: any(named: 'name'),
            email: any(named: "email"),
            password: any(named: "password"),
            institution: any(named: "institution"),
            role: any(named: "role"))).thenAnswer((_) async => AuthFailure.emailInUse());
        return unitUnderTest;
      },

      seed: () => validState,
      act: (_) => unitUnderTest.add(RegisterEvent.registerWithFormFilledPressed()),
      expect: () => [
        validState.copyWith(isSubmitting: true),
        validState.copyWith(isSubmitting: false, authFailureOption: AuthFailure.emailInUse(), showInputErrorMessages: true)]
      ,
      verify: (_) {
        verify(() => mockAuthService.getInstitutions()).called(1);
        verify(() => mockAuthService.registerUser(institution: validState.institution!, name: validState.name, role: validState.role, password: validState.password
            , email: validState.emailAddress)).called(1);
        verifyNoMoreInteractions(mockAuthService);
      }
  );




  //if creator creates a Request

}
