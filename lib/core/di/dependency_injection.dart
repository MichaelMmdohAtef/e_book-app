import 'package:e_bookwebsitetest/core/networking/firebase_services.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/repos/login_repo.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/repos/register_repo.dart';
import 'package:e_bookwebsitetest/features/authentication/logic/cubit/cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // FirebaseServices firebaseServices = FirebaseServices();
  getIt.registerLazySingleton<FirebaseServices>(() => FirebaseServices());

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));

  getIt.registerFactory<AuthenticationCubit>(
      () => AuthenticationCubit(getIt(), getIt()));
}
