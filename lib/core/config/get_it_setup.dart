import 'package:blue_collar_app/features/user_app_features/user_auth/data/repository/auth_repository.dart';
import 'package:blue_collar_app/utils/dialog_services.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<DialogServices>(() => DialogServices());
}
