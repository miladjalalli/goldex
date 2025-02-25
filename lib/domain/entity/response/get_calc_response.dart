import 'dart:convert';

class GetCalcResponse {
  int? status;
  String? error;
  String? message;
  GetCalcResponseData? data;

  GetCalcResponse({this.status, this.error, this.message, this.data});

  GetCalcResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new GetCalcResponseData.fromJson(json['data']) : null;
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

class GetCalcResponseData {
  double? fiatAmount;
  double? estimatedGoldMg;
  double? estimatedGoldGrams;
  double? feePercent;
  double? totalCostUsd;

  GetCalcResponseData(
      {this.fiatAmount,
        this.estimatedGoldMg,
        this.estimatedGoldGrams,
        this.feePercent,
        this.totalCostUsd});

  GetCalcResponseData.fromJson(Map<String, dynamic> json) {
    fiatAmount = json['fiat_amount'];
    estimatedGoldMg = json['estimated_gold_mg'];
    estimatedGoldGrams = json['estimated_gold_grams'];
    feePercent = json['fee_percent'];
    totalCostUsd = json['total_cost_usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fiat_amount'] = this.fiatAmount;
    data['estimated_gold_mg'] = this.estimatedGoldMg;
    data['estimated_gold_grams'] = this.estimatedGoldGrams;
    data['fee_percent'] = this.feePercent;
    data['total_cost_usd'] = this.totalCostUsd;
    return data;
  }
}

