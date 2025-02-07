import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:goldex/data/repository/api_repository_impl.dart';
import 'package:goldex/data/client/api_client.dart';
import 'package:goldex/data/source/network/remote_data_source.dart';
import 'package:goldex/domain/repository/api_repository.dart';
import 'package:goldex/presentation/login/cubit/login_cubit.dart';


final sl = GetIt.instance;

void init() {
  // Dio Client
  sl.registerLazySingleton(() => ApiClient(dio: Dio()));

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSource(apiClient: sl()),
  );

  // Repository
  sl.registerLazySingleton<ApiRepository>(
        () => ApiRepositoryImpl(remoteDataSource: sl()),
  );

  // Bloc
  sl.registerFactory(() => LoginCubit(apiRepository: sl()));
}
