import 'package:dio/dio.dart';

abstract class ApiRepository {

  Future<Response> register(Map<String, dynamic> data);

  Future<Response> chargeWallet(Map<String, dynamic> data);

  Future<Response> buyGoldByWeight(Map<String, dynamic> data);

  Future<Response> buyGoldByAmount(Map<String, dynamic> data);

  Future<Response> getGoldBalance(String userId);

  Future<Response> getCurrencyBalance(String userId);

  Future<Response> getUserTransactions(String userId);

  Future<Response> sellGold(Map<String, dynamic> data);

  Future<Response> transferGold(Map<String, dynamic> data);

  Future<Response> transferCurrency(Map<String, dynamic> data);
}
