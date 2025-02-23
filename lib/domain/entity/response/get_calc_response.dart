import 'dart:convert';

GetCalcResponse getCalcResponseFromJson(String str) => GetCalcResponse.fromJson(json.decode(str));

String getCalcResponseToJson(GetCalcResponse data) => json.encode(data.toJson());

class GetCalcResponse {
  double? goldWeightMg;
  double? goldWeightGrams;
  double? feePercent;
  double? totalCostUsd;
  double? fiatAmount;
  double? estimatedGoldMg;
  double? estimatedGoldGrams;

  GetCalcResponse({
    this.goldWeightMg,
    this.goldWeightGrams,
    this.feePercent,
    this.totalCostUsd,
    this.fiatAmount,
    this.estimatedGoldMg,
    this.estimatedGoldGrams,
  });

  factory GetCalcResponse.fromJson(Map<String, dynamic> json) => GetCalcResponse(
    goldWeightMg: json["gold_weight_mg"] != null ? json["gold_weight_mg"].toDouble() : 0,
    goldWeightGrams: json["gold_weight_grams"] != null ? json["gold_weight_grams"].toDouble() : 0,
    feePercent: json["fee_percent"] != null ? json["fee_percent"].toDouble() : 0,
    totalCostUsd: json["total_cost_usd"] != null ? json["total_cost_usd"].toDouble() : 0,
    fiatAmount: json["fiat_amount"] != null ? json["fiat_amount"].toDouble() : 0,
    estimatedGoldMg: json["estimated_gold_mg"] != null ? json["estimated_gold_mg"].toDouble() : 0,
    estimatedGoldGrams: json["estimated_gold_grams"] != null ? json["estimated_gold_grams"].toDouble() : 0,
  );

  Map<String, dynamic> toJson() => {
    "gold_weight_mg": goldWeightMg,
    "gold_weight_grams": goldWeightGrams,
    "fee_percent": feePercent,
    "total_cost_usd": totalCostUsd,
    "fiat_amount": fiatAmount,
    "estimated_gold_mg": estimatedGoldMg,
    "estimated_gold_grams": estimatedGoldGrams,
  };
}
