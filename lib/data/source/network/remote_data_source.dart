import 'package:dio/dio.dart';
import 'package:goldex/data/client/api_client.dart';

 class RemoteDataSource {
  final ApiClient apiClient;

  RemoteDataSource({required this.apiClient});

  Future<Response> chargeWallet(Map<String, dynamic> data) async {
    return await apiClient.postRequest('/api/v1/wallet/charge-card/', data: data);
  }

  Future<Response> buyGoldByWeight(Map<String, dynamic> data) async {
    return await apiClient.postRequest('/api/v1/buy-gold-by-weight/', data: data);
  }

  Future<Response> buyGoldByAmount(Map<String, dynamic> data) async {
    return await apiClient.postRequest('/api/v1/buy-gold-by-amount/', data: data);
  }

  Future<Response> getGoldBalance(String userId) async {
    return await apiClient.getRequest('/api/v1/gold-balance/$userId');
  }

  Future<Response> getCurrencyBalance(String userId) async {
    return await apiClient.getRequest('/api/v1/currency-balance/$userId');
  }

  Future<Response> getUserTransactions(String userId) async {
    return await apiClient.getRequest('/api/v1/user-transactions/$userId');
  }

  Future<Response> sellGold(Map<String, dynamic> data) async {
    return await apiClient.postRequest('/api/v1/sell-gold/', data: data);
  }

  Future<Response> transferGold(Map<String, dynamic> data) async {
    return await apiClient.postRequest('/api/v1/transfer-gold/', data: data);
  }

  Future<Response> transferCurrency(Map<String, dynamic> data) async {
    return await apiClient.postRequest('/api/v1/transfer-currency/', data: data);
  }
  }
