import 'package:digtial_costume_platform/application/auth/auth_bloc.dart';
import 'package:digtial_costume_platform/application/auth/register/register_bloc.dart';
import 'package:digtial_costume_platform/application/auth/sign_in/sign_in_bloc.dart';
import 'package:digtial_costume_platform/application/costume/details/costume_details_bloc.dart';
import 'package:digtial_costume_platform/application/costume/edit/costume_form_bloc.dart';
import 'package:digtial_costume_platform/application/gallery/category_select/category_selection_bloc.dart';
import 'package:digtial_costume_platform/domain/auth/i_auth_service.dart';
import 'package:digtial_costume_platform/domain/auth/i_user_service.dart';
import 'package:digtial_costume_platform/domain/costume/i_costume_repository.dart';
import 'package:digtial_costume_platform/infrastructure/auth/firebase_auth_repository.dart';
import 'package:digtial_costume_platform/infrastructure/auth/firebase_user_repository.dart';
import 'package:digtial_costume_platform/infrastructure/costume/firebase_costume_repository.dart';
import 'package:digtial_costume_platform/services/gallery_service.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:get_it/get_it.dart';

class Locator {
  final locator = GetIt.instance;

  void setUp() {
    //Services
    //TODO
    locator.registerLazySingleton<IUserService>(() => FirebaseUserRepository());
    locator.registerLazySingleton<ICostumeRepository>(
        () => FirebaseCostumeRepository());
    locator.registerLazySingleton<IAuthService>(
        () => FirebaseAuthRepository(locator<IUserService>()));
    locator.registerLazySingleton<IGalleryService>(
        () => GalleryService(locator<ICostumeRepository>()));

    //BLoCs
    locator
        .registerFactory<SignInBloc>(() => SignInBloc(locator<IAuthService>()));
    locator.registerFactory<RegisterBloc>(
        () => RegisterBloc(locator<IAuthService>()));
    locator.registerFactory<AuthBloc>(() => AuthBloc(locator<IAuthService>()));
    locator.registerFactory<CategorySelectionBloc>(
        () => CategorySelectionBloc(locator<IGalleryService>()));
    //CostumeListBLoc
    locator.registerFactory<CostumeFormBloc>(() => CostumeFormBloc(
        locator<ICostumeRepository>(), locator<IGalleryService>()));
    locator.registerFactory<CostumeDetailsBloc>(
        () => CostumeDetailsBloc(locator<IGalleryService>()));
    //ImageBloc
    //SearchBloc
  }
}
