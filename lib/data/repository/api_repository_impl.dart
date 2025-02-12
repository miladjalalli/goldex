import 'package:dio/dio.dart';
import 'package:goldex/data/source/network/remote_data_source.dart';
import 'package:goldex/domain/repository/api_repository.dart';

class ApiRepositoryImpl extends ApiRepository {
  final RemoteDataSource remoteDataSource;

  ApiRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Response> register(Map<String, dynamic> data) => remoteDataSource.register(data);

  @override
  Future<Response> chargeWallet(Map<String, dynamic> data) => remoteDataSource.chargeWallet(data);

  @override
  Future<Response> buyGoldByWeight(Map<String, dynamic> data) => remoteDataSource.buyGoldByWeight(data);

  @override
  Future<Response> buyGoldByAmount(Map<String, dynamic> data) => remoteDataSource.buyGoldByAmount(data);

  @override
  Future<Response> getGoldBalance(String userId) => remoteDataSource.getGoldBalance(userId);

  @override
  Future<Response> getCurrencyBalance(String userId) => remoteDataSource.getCurrencyBalance(userId);

  @override
  Future<Response> getUserTransactions(String userId) => remoteDataSource.getUserTransactions(userId);

  @override
  Future<Response> sellGold(Map<String, dynamic> data) => remoteDataSource.sellGold(data);

  @override
  Future<Response> transferGold(Map<String, dynamic> data) => remoteDataSource.transferGold(data);

  @override
  Future<Response> transferCurrency(Map<String, dynamic> data) => remoteDataSource.transferCurrency(data);
}
