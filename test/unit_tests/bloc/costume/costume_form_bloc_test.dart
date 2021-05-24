import 'package:bloc_test/bloc_test.dart';
import 'package:digtial_costume_platform/bloc/costume/edit/costume_form_bloc.dart';
import 'package:digtial_costume_platform/data/services/gallery_service.dart';
import 'package:digtial_costume_platform/domain/costume/storage_location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGalleyService  extends Mock implements GalleryService{}

main() {
  late MockGalleyService mockGalleyService;
  late CostumeFormBloc unitUnderTest;
  final mockCategories = <String>[ "pants", "skirts", "shoes"];
  final mockTimes = <String>[ "1920s", "1930s", "1930"];
  final mockMainStorageOptions = <Location>[Location(id: "HKG85pRFynnJRiPZsyh7", location: "First"), Location(id: "FGIiBuJ4PjitPDnGPC09",location: "Second")];
  final mocksSubLocation = <Location>[
    Location(id: "OtaHJEUS4ahZtfSrkwZz", location: "1st"),
    Location(id: "SKMKWxBUmzYHoQm5YFUu", location: "2nd"),
    Location(id: "o3LQUCDreRXgPfqVA5AA", location: "3rd")
  ];

  final validState = CostumeFormState.initial().copyWith(categoryOptions: mockCategories, timePeriodOptions: mockTimes,
      storageMainLocationOptions: mockMainStorageOptions);
  setUp(() {
    mockGalleyService = MockGalleyService();
    unitUnderTest = CostumeFormBloc(mockGalleyService);
  });

  blocTest("when form return with unSavedChanges set when changing category",
      build: () {
        when(() => mockGalleyService.getCategories()).thenAnswer((
            _) async => mockCategories);
        when(() => mockGalleyService.getTimePeriods()).thenAnswer((
            _) async => mockTimes);
        when(() => mockGalleyService.getStorageMainLocations()).thenAnswer((
            _) async => mockMainStorageOptions);
        return unitUnderTest;
      },
      seed: () => validState,
      act: (_) {
        unitUnderTest.add(const CostumeFormEvent.categorySelected("pants"));
      },
      expect: () =>
      [
        validState.copyWith(unSavedChanges: true, category: "pants")
      ],
      verify: (_) {
        verify( () => mockGalleyService.getCategories()).called(1);
        verify( () => mockGalleyService.getTimePeriods()).called(1);
        verify( () => mockGalleyService.getStorageMainLocations()).called(1);
        verifyNoMoreInteractions(mockGalleyService);
      }
  );

  blocTest("saving resets unSavedChanges",
      build: () {
        when(() => mockGalleyService.getCategories()).thenAnswer((
            _) async => mockCategories);
        when(() => mockGalleyService.getTimePeriods()).thenAnswer((
            _) async => mockTimes);
        when(() => mockGalleyService.getStorageMainLocations()).thenAnswer((
            _) async => mockMainStorageOptions);
        return unitUnderTest;
      },
      seed: () => validState.copyWith(category: "pants", unSavedChanges: true),
      act: (_) {
        unitUnderTest.add(const CostumeFormEvent.saveCostume());
      },
      expect: () =>
      [
        validState.copyWith(unSavedChanges: false, category: "pants")
      ],
      verify: (_) {
        verify( () => mockGalleyService.getCategories()).called(1);
        verify( () => mockGalleyService.getTimePeriods()).called(1);
        verify( () => mockGalleyService.getStorageMainLocations()).called(1);
        //verifyNoMoreInteractions(mockGalleyService);
      }
  );

  /*blocTest("Registerbloc return no new state if password is not valid",
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
  blocTest("Registerbloc returns form with authFailure if failing register",
      build: () {
        when(() => mockAuthService.getInstitutions()).thenAnswer((
            _) async => []);
        when(() => mockAuthService.registerUser(name: any(named: 'name'),
            email: any(named: "email"),
            password: any(named: "password"),
            institution: any(named: "institution"),
            role: any(named: "role"))).thenAnswer((_) async => null);
        return unitUnderTest;
      },

      seed: () => validState,
      act: (_) => unitUnderTest.add(RegisterEvent.registerWithFormFilledPressed()),
      expect: () => [
        validState.copyWith(isSubmitting: true),
        validState.copyWith(isSubmitting: false, authFailureOption: null, showInputErrorMessages: true)
      ]
      ,
      verify: (_) {
        verify(() => mockAuthService.getInstitutions()).called(1);
        verify(() => mockAuthService.registerUser(institution: validState.institution!, name: validState.name, role: validState.role, password: validState.password
            , email: validState.emailAddress)).called(1);
        verifyNoMoreInteractions(mockAuthService);
      }
  ); */

}