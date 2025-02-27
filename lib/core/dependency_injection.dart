import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:goldex/data/repository/api_repository_impl.dart';
import 'package:goldex/data/client/api_client.dart';
import 'package:goldex/data/repository/secure_storage_service_impl.dart';
import 'package:goldex/data/source/network/remote_data_source.dart';
import 'package:goldex/domain/repository/api_repository.dart';
import 'package:goldex/domain/repository/secure_storage_service.dart';
import 'package:goldex/presentation/login/cubit/login_cubit.dart';
import 'package:goldex/presentation/sell/cubit/sell_cubit.dart';
import 'package:goldex/presentation/sign_up/cubit/sing_up_cubit.dart';
import 'package:goldex/presentation/splash/cubit/splash_cubit.dart';
import 'package:goldex/presentation/transfer/cubit/transfer_cubit.dart';

import '../presentation/buy/cubit/buy_cubit.dart';
import '../presentation/order_summary/cubit/order_summary_cubit.dart';
import '../presentation/profile/cubit/profile_cubit.dart';
import '../presentation/transaction/cubit/transaction_cubit.dart';


final sl = GetIt.instance;

void init() {
  // Dio Client
  sl.registerLazySingleton(() => ApiClient(dio: Dio(),secureStorageService: sl()));

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSource(apiClient: sl()),
  );

  // Repository
  sl.registerLazySingleton<ApiRepository>(
        () => ApiRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<SecureStorageService>(
        () => SecureStorageServiceImpl(),
  );

  // Bloc
  sl.registerFactory(() => SplashCubit(secureStorageService: sl()));
  sl.registerFactory(() => LoginCubit(apiRepository: sl(),secureStorageService: sl()));
  sl.registerFactory(() => SingUpCubit(apiRepository: sl(),secureStorageService: sl()));
  sl.registerFactory(() => BuyCubit(apiRepository: sl(),secureStorageService: sl()));
  sl.registerFactory(() => SellCubit(apiRepository: sl(),secureStorageService: sl()));
  sl.registerFactory(() => TransactionCubit(apiRepository: sl(),secureStorageService: sl()));
  sl.registerFactory(() => TransferCubit(apiRepository: sl()));
  sl.registerFactory(() => ProfileCubit(apiRepository: sl(),secureStorageService: sl()));
  sl.registerFactory(() => OrderSummaryCubit(apiRepository: sl(),secureStorageService: sl()));
}
