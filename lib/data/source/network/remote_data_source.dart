import 'package:dio/dio.dart';
import 'package:goldex/data/client/api_client.dart';

 class RemoteDataSource {
  final ApiClient apiClient;

  RemoteDataSource({required this.apiClient});

  Future<Response> login(Map<String, dynamic> data) async {
    return await apiClient.postRequest('user/register', data: data);
  }
  Future<Response> register(Map<String, dynamic> data) async {
    return await apiClient.postRequest('user/login', data: data);
  }
  Future<Response> chargeWallet(Map<String, dynamic> data) async {
    return await apiClient.postRequest('wallet/charge-card/', data: data);
  }

  Future<Response> buyGoldByWeight(Map<String, dynamic> data) async {
    return await apiClient.postRequest('buy-gold-by-weight/', data: data);
  }

  Future<Response> buyGoldByAmount(Map<String, dynamic> data) async {
    return await apiClient.postRequest('buy-gold-by-amount/', data: data);
  }

  Future<Response> getGoldBalance(String userId) async {
    return await apiClient.getRequest('gold-balance/$userId');
  }

  Future<Response> getCurrencyBalance(String userId) async {
    return await apiClient.getRequest('currency-balance/$userId');
  }

  Future<Response> getUserTransactions(String userId) async {
    return await apiClient.getRequest('user-transactions/$userId');
  }

  Future<Response> sellGold(Map<String, dynamic> data) async {
    return await apiClient.postRequest('sell-gold/', data: data);
  }

  Future<Response> transferGold(Map<String, dynamic> data) async {
    return await apiClient.postRequest('transfer-gold/', data: data);
  }

  Future<Response> transferCurrency(Map<String, dynamic> data) async {
    return await apiClient.postRequest('transfer-currency/', data: data);
  }
  }
