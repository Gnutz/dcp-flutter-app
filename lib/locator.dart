import 'package:digtial_costume_platform/application/auth/gallery/category_select/category_selection_bloc.dart';
import 'package:digtial_costume_platform/application/auth/sign_in/sign_in_bloc.dart';
import 'package:digtial_costume_platform/services/gallery_service.dart';
import 'package:digtial_costume_platform/services/i_gallery_service.dart';
import 'package:get_it/get_it.dart';

import 'domain/auth/i_auth_service.dart';

class Locator {
  final locator = GetIt.instance;

  void setUp() {
    //Services
    //TODO
    //locator.registerLazySingleton<IAuthService>(() => FirebaseAuthRepository());
    locator.registerLazySingleton<IGalleryService>(() => GalleryService());

    //BLoCs
    locator
        .registerFactory<SignInBloc>(() => SignInBloc(locator<IAuthService>()));
    locator.registerFactory<CategorySelectionBloc>(
        () => CategorySelectionBloc(locator<IGalleryService>()));
  }
}
