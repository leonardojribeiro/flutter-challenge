import 'package:flutter_challenge/app_state.dart';
import 'package:flutter_challenge/modules/auth/auth_repository.dart';
import 'package:flutter_challenge/modules/auth/auth_state.dart';
import 'package:flutter_challenge/modules/cats/cats_repository.dart';
import 'package:flutter_challenge/modules/cats/cats_state.dart';
import 'package:flutter_challenge/modules/dogs/dogs_repository.dart';
import 'package:flutter_challenge/modules/dogs/dogs_state.dart';
import 'package:flutter_challenge/services/api/api_service.dart';
import 'package:get_it/get_it.dart';

void setupDependencies() {
  GetIt.I.registerLazySingleton<ApiService>(() => ApiService());
  //cats
  GetIt.I.registerLazySingleton<CatsRepository>(() => CatsRepository());
  GetIt.I.registerLazySingleton<CatsState>(() => CatsState());
  //dogs
  GetIt.I.registerLazySingleton<DogsRepository>(() => DogsRepository());
  GetIt.I.registerLazySingleton<DogsState>(() => DogsState());
  //auth
  GetIt.I.registerLazySingleton<AuthRepository>(() => AuthRepository());
  GetIt.I.registerLazySingleton<AuthState>(() => AuthState());
  //app
  GetIt.I.registerLazySingleton<AppState>(() => AppState());
}
