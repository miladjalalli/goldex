import 'dart:convert';

class GoldBalanceResponse {
  int? status;
  String? error;
  String? message;
  GoldBalanceResponseData? data;

  GoldBalanceResponse({this.status, this.error, this.message, this.data});

  GoldBalanceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new GoldBalanceResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GoldBalanceResponseData {
  double? goldBalanceMg;

  GoldBalanceResponseData({this.goldBalanceMg});

  GoldBalanceResponseData.fromJson(Map<String, dynamic> json) {
    goldBalanceMg = json['gold_balance_mg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gold_balance_mg'] = this.goldBalanceMg;
    return data;
  }
}

