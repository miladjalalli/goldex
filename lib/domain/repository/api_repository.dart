import 'package:dio/dio.dart';

abstract class ApiRepository {

  Future<Response> login(Map<String, dynamic> data);

  Future<Response> register(Map<String, dynamic> data);

  Future<Response> confirmRegister(Map<String, dynamic> data);

  Future<Response> signUp(Map<String, dynamic> data);

  Future<Response> setPassword(Map<String, dynamic> data);

  Future<Response> chargeWallet(Map<String, dynamic> data);

  Future<Response> buyGoldByWeight(Map<String, dynamic> data);

  Future<Response> buyGoldByAmount(Map<String, dynamic> data);

  Future<Response> getGoldBalance(String userId);

  Future<Response> getCurrencyBalance(String userId);

  Future<Response> getUserTransactions(String userId);

  Future<Response> sellGold(Map<String, dynamic> data);

  Future<Response> transferGold(Map<String, dynamic> data);

  Future<Response> transferCurrency(Map<String, dynamic> data);

  Future<Response> goldCalc(Map<String, dynamic> data);

  Future<Response> livePrice();

  Future<Response> goldBalance();

  Future<Response> currencyBalance();

  Future<Response> transferCurrencyWithMobile();

  Future<Response> giftCards();
}
