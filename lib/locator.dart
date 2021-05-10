import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digtial_costume_platform/bloc/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/bloc/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/bloc/auth/sign_in/sign_in_bloc.dart';
import 'package:digtial_costume_platform/bloc/costume/details/costume_details_bloc.dart';
import 'package:digtial_costume_platform/bloc/costume/edit/costume_form_bloc.dart';
import 'package:digtial_costume_platform/bloc/costume_image_watcher_bloc.dart';
import 'package:digtial_costume_platform/bloc/gallery/category_select/category_selection_bloc.dart';
import 'package:digtial_costume_platform/bloc/gallery/gallery_bloc.dart';
import 'package:digtial_costume_platform/bloc/gallery/search_form/search_form_bloc.dart';
import 'package:digtial_costume_platform/domain/auth/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/i_user_service.dart';
import 'package:digtial_costume_platform/data/infrastructure/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/data/infrastructure/auth/firebase_user_repository.dart';
import 'package:digtial_costume_platform/data/infrastructure/costume/firebase_costume_repository.dart';
import 'package:digtial_costume_platform/data/services/gallery_service.dart';
import 'package:digtial_costume_platform/data/services/i_gallery_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import 'data/infrastructure/auth/firebase_auth_repository.dart';

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
    locator.registerFactory<CostumeImageWatcherBloc>(() => CostumeImageWatcherBloc(locator<IGalleryService>()));
    //ImageBloc
  }
}
