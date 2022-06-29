import 'package:flutter_challenge/modules/cats/cats_repository.dart';
import 'package:flutter_challenge/services/api/api_service.dart';
import 'package:get_it/get_it.dart';

void setupDependencies() {
  GetIt.I.registerLazySingleton<ApiService>(() => ApiService());

  GetIt.I.registerLazySingleton<CatsRepository>(() => CatsRepository());
  GetIt.I.registerLazySingleton<ApiService>(() => ApiService());
}
