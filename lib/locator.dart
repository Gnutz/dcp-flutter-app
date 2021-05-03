import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/application/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/application/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/application/auth/sign_in/sign_in_bloc.dart';
import 'package:digtial_costume_platform/application/costume/details/costume_details_bloc.dart';
import 'package:digtial_costume_platform/application/costume/edit/costume_form_bloc.dart';
import 'package:digtial_costume_platform/application/gallery/category_select/category_selection_bloc.dart';
import 'package:digtial_costume_platform/application/gallery/gallery_bloc.dart';
import 'package:digtial_costume_platform/application/gallery/search_form/search_form_bloc.dart';
import 'package:digtial_costume_platform/domain/auth/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/i_user_service.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/infrastructure/auth/firebase_auth_repository.dart';
import 'package:digtial_costume_platform/infrastructure/auth/firebase_user_repository.dart';
import 'package:digtial_costume_platform/infrastructure/costume/firebase_costume_repository.dart';
import 'package:digtial_costume_platform/services/gallery_service.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

class Locator {
  final locator = GetIt.instance;

  void setUp() {
    locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    locator.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    locator
        .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

    //Services
    locator.registerLazySingleton<IUserService>(() => FirebaseUserRepository());
    locator.registerLazySingleton<ICostumeRepository>(() =>
        FirebaseCostumeRepository(
            locator<FirebaseFirestore>(), locator<FirebaseStorage>()));
    locator.registerLazySingleton<IAuthService>(
        () => FirebaseAuthRepository(locator<IUserService>()));
    locator.registerLazySingleton<IGalleryService>(
            () => GalleryService(locator<ICostumeRepository>()));

    //BLoCs
    locator.registerFactory<GalleryBloc>(
            () => GalleryBloc(locator<IGalleryService>()));
    locator.registerFactory<AuthBloc>(() => AuthBloc(locator<IAuthService>(), locator<IGalleryService>()));
    locator
        .registerFactory<SignInBloc>(() => SignInBloc(locator<IAuthService>()));
    locator.registerFactory<RegisterBloc>(
        () => RegisterBloc(locator<IAuthService>()));
    locator.registerFactory<CategorySelectionBloc>(
            () => CategorySelectionBloc(locator<IGalleryService>()));
    //CostumeListBLoc
    locator.registerFactory<CostumeFormBloc>(() => CostumeFormBloc(locator<IGalleryService>()));
    locator.registerFactory<CostumeDetailsBloc>(
            () => CostumeDetailsBloc(locator<IGalleryService>()));
    locator.registerFactory<SearchFormBloc>(
            () => SearchFormBloc(locator<IGalleryService>()));
    //ImageBloc
  }
}
